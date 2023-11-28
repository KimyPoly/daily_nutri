class MealsController < ApplicationController
  def show
    @meal = Meal.find(:id)
  end
end
