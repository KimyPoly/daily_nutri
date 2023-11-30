class ProgramsController < ApplicationController

  skip_before_action :authenticate_user!, only: :new
  before_action :set_program, only: %i[show]

  def show
    @meals = Meal.all
    @user = current_user
  end

  def new
    session[:program_params] ||= {}
    @program = Program.new(session[:program_params])
    @step = session[:step] || 1
    session[:step] = @step
  end

  def create

    options = session[:program_params].deep_merge!(program_params)
    @program = Program.new(options)
    @program.user = current_user
    @step = session[:step]
    if @step == 7
      session[:program_params] = nil
      session[:step] = nil
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

    # raise

    if @program.update(program_params)
      @program.assign_attributes(allergies: program_params[:allergies], diet: program_params[:diet], height: program_params[:height])

      redirect_to program_path, notice: "Les modifications ont été enregistrées avec succès."
    else
      render :edit
    end
  end

  private

  def program_params
    params.require(:program).permit(:goal, :diet, :allergies, :nb_of_meals_by_day, :nb_of_days, :nb_of_snacks, :height, :weight, :step)
  end


  def set_program
    @program = Program.find(params[:id])
  end
end
