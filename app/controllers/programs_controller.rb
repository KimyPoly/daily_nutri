class ProgramsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  before_action :set_program, only: %i[show edit]

  def show
    @meals = @program.meals
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
        redirect_to dashboard_path
      else
        redirect_to new_program_path
      end
    else
      new_step = @step + 1
      session[:step] = new_step
      redirect_to new_program_path
    end

  end

  def edit

  end

  private

  def program_params
    params.require(:program).permit(:goal, :diet, :allergies, :nb_of_meals_by_day, :nb_of_days, :nb_of_snacks, :height, :weight, :step)
  end


  def set_program
    @program = Program.find(params[:id])
  end
end
