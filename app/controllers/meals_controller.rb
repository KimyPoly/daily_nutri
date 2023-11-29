class MealsController < ApplicationController
  before_action :set_meal, only: %i[show]

  def index
    @meals = Meal.all
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

  def meal_params
    params.require(:meal).permit(:program_id,)
  end

end
