class MealAssignmentsController < ApplicationController
  def index
    @meal_assignment = Meal.all
  end

  

  private

  def meal_assignment_params
    params.require(:meal_assignment).permit(:meal_id, :program_id)
  end

end
