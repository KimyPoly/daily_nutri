class MealsController < ApplicationController
  before_action :set_meal, only: %i[show]
  before_action :set_program, only: %i[index]

  def index
    set_program_options
    raise
    @meals = Meal.where()
  end
  def show
  end

  def process_meals
    selected_meal_ids = params[:selected_meals]

    if selected_meal_ids.present?
      selected_meals = Meal.where(id: selected_meal_ids)
      selected_meals.each do |meal|
        meal.save
      end
      redirect_to root_path, notice: "Vos sélections ont été enregistrées avec succès."
    else
      redirect_to root_path, alert: "Veuillez sélectionner au moins un repas."
    end
  end

  def update
    if @meal.update(meal_params)
      redirect_to @meal, notice: 'Meal was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def set_program
    @program = Program.find(params[:program_id])
  end


  def meal_params
    params.require(:meal).permit(:program_id)
  end

  def calculated_goal
    @genre = params[:program][:sexe]
    @asked_goal = params[:program][:goal]
    @calories = 0

    case @calories
    when @genre == "Male" && @asked_goal == "Weight maintenance"
      @calories = 2600
    when @genre == "Male" && @asked_goal == "Lose weight"
      @calories = 2300
    when @genre == "Male" && @asked_goal == "Take weight"
      @calories = 3100
    when @genre == "Female" && @asked_goal == "Weight maintenance"
      @calories = 2000
    when @genre == "Female" && @asked_goal == "Lose weight"
      @calories = 1800
    when @genre == "Female" && @asked_goal == "Take weight"
      @calories = 2500
    end

    return @calories
  end

  def set_program_options
    @diet = @program.diet
    @allergies = @program.allergies
  end

end
