class MealsController < ApplicationController
  before_action :set_meal, only: %i[show]

  def index
    @meals = Meal.all
  end

  def show
  end

  def process_meals
    @program = Program.find(params[:program_id])

    if params[:selected_meals].present?
      @meals = Meal.where(id: params[:selected_meals])
      @meals.each do |meal|
        # @program.meals << meal
        MealAssignement.create(
          program: @program,
          meal:
        )
      end
      # @program.save!
      redirect_to dashboard_path, notice: "Vos sélections ont été enregistrées avec succès."
    else
      redirect_to dashboard_path, alert: "Veuillez sélectionner au moins un repas."
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
    params.require(:meal).permit(:program_id)
  end

end
