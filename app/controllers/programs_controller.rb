class ProgramsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  before_action :set_program, only: %i[show edit]

  def show
    @meals = Meal.all
  end

  def new
    @program = Program.new
    @program.user = current_user
  end

  def create
    @program = Program.new(program_params)
    @user = current_user
    @program.user = @user
    @program.save
    redirect_to program_meals_path(@program)
  end

  def edit

  end

  private

  def program_params
    params.require(:program).permit(:goal, :user_id, :diet, :allergies, :nb_of_meals_by_day, :nb_of_days, :nb_of_snacks, :height, :weight)
  end

  def set_program
    @program = Program.find(params[:id])
  end
end
