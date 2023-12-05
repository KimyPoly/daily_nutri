class ProgramsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new
  before_action :set_program, only: %i[show]

  def show

    if params[:index].present?
      @index_day = params[:index].to_i
    else
      @index_day = 0
    end
    # @meals = current_user.programs.first.meals
    @meals = Meal.all
    @user = current_user
    @dishes = @program.meals.where(meal_type: "dish")
    @breakfasts = @program.meals.where(meal_type: "breakfast")
    @dishes = @dishes.each_slice(@program.nb_of_meals_by_day - 1).to_a
    @breakfast = @breakfasts[@index_day]
    return unless @breakfasts.count > @program.nb_of_days

    @breakfasts.each_with_index { |breakfast, index| @dishes.push(breakfast) if index > (@program.nb_of_days - 1) }
    @meals = current_user.programs.last.meals
  end

  def new
    session[:program_params] ||= {}
    @program = Program.new(session[:program_params])
    @step = session[:step] || 1
    session[:step] = @step
  end

  def grocery
    @program = Program.find(params[:id])
    @ingredients = []

    # Parcourir tous les repas associés au programme
    @program.meals.each do |meal|
      # Récupérer les ingrédients du repas et les ajouter à la liste des ingrédients
      @ingredients += meal.ingredients.split(',').map(&:strip)
    end

    # Créer une liste unique des ingrédients
    @ingredients = @ingredients.uniq
  end

  def meals_options
    redirect_to dashboard_path
  end

  def create
    options = session[:program_params].deep_merge!(program_params)
    if options["allergies"].kind_of?(Array)
      options["allergies"] = format_allergies(options["allergies"])
    end
    @program = Program.new(options)
    @program.user = current_user
    @step = session[:step]

    if @step == 6

      empty_cookies

      if @program.save
        redirect_to program_meals_path(@program)
      else
        redirect_to new_program_path
      end
    else
      new_step = @step + 1
      session[:step] = new_step
      redirect_to new_program_path
    end
  end

  def update
    @program = Program.find(params[:id])

    if @program.update(program_params)
      @program.assign_attributes(allergies: program_params[:allergies], diet: program_params[:diet], height: program_params[:height])

      redirect_to program_path, notice: "Your changes have been saved."
    else
      render :edit
    end
  end

  private

  def program_params
    params.require(:program).permit(:goal, :diet, :nb_of_meals_by_day, :nb_of_days, :nb_of_snacks, :height, :weight, :sexe, :step, allergies: [])
  end

  def set_program
    @program = Program.find(params[:id])
  end

  def format_allergies(array)
    array.reject(&:empty?).join(", ")
  end

  def empty_cookies
    empty_params
    empty_step
  end

  def empty_step
    session[:step] = nil
  end

  def empty_params
    session[:program_params] = nil
  end
end
