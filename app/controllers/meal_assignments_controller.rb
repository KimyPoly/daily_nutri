class MealAssignmentsController < ApplicationController
  def index
    @meal = Meal.find(params[:meal_id])
    @meal_assignments = @meal.meal_assignments
  end

  def create
    @meal = Meal.find(params[:meal_id])
    @meal_assignment = @meal.meal_assignments.build(meal_assignment_params)

    if @meal_assignment.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @meal_assignment = MealAssignment.find(params[:id])
    @meal_assignment.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def meal_assignment_params
    params.require(:meal_assignment).permit(:meal_id, :program_id)
  end

end
