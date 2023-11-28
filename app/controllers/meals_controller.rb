class MealsController < ApplicationController
  before_action :set_meal, only: %i[show]

  def show
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end
end
