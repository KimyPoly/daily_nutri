class MealsController < ApplicationController
  before_action :set_meal, only: %i[show]
  before_action :set_program, only: %i[index]

  def index
    # it would be interesting to have a multiple-step form for the selection, so for 2 days & 2 meals per day, slide 1 day 1 select 2 meals, then slide 2 day 2 select 2 meals 
    @meals = Meal.all
    set_program_options
    # le filter @diet fonctionne mais pas sur omnivorious
    @meals = Meal.where("diet ~* ?", @diet)
    # @allergies = @allergies.split(",")
    # @allergies.each do |allergy|
    #   downcase_allergy = allergy.downcase
    #   forbidden_ingredients = allergies_dictionary[downcase_allergy.to_s]
    #   break unless forbidden_ingredients
    #   forbidden_ingredients.each do |forbidden_ingredient|
    #     @meals = @meals.where.not("ingredients ~* ?", forbidden_ingredient)
    #   end
    # end

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
      redirect_to dashboard_path, notice: "Your choices have been saved."
    else
      redirect_to dashboard_path, alert: "Select at least one meal."
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

  def allergies_dictionary
      {

      nuts: [
        "Almonds", "Cashews", "Walnuts", "Pecans", "Brazil nuts",
        "Macadamia nuts", "Pistachios", "Pine nuts", "Hazelnuts", "Chestnuts"
      ],
      crustaceans: [
        "Shrimp", "Crab", "Lobster", "Crayfish", "Prawns", "Scampi", "Langoustines"
      ],
      milk: [
        "milk", "butter", "cream", "cheese"
      ],
      eggs: [
        "eggs", "pancakes"
      ],
      fish: [
        "Salmon", "Tuna", "Cod", "Trout", "Haddock",
        "Sardines", "Mackerel", "Anchovies", "Herring", "Bass", "Mahi Mahi", "Swordfish", "Perch", "Pollock", "Snapper", "Eel"
      ],
      shellfish: [
        "clams", "crab", "lobster", "mussels", "oysters", "scallops", "shrimp", "snails", "squid"
      ],
      peanuts: [
        "Peanuts"
      ],
      wheat: [
        "Wheat flour", "bread", "pasta", "couscous", "crackers", "cookies", "cakes", "muffins", "pastries", "cereals", "beer"
      ],
      soybeans: [
        "Soybeans", "tofu", "tempeh", "edamame", "soy milk", "soy sauce"
      ],
      sesame: [
        "Sesame seeds", "Sesame oil", "Tahini"
      ]
    }
    end

end

   # foreach sur chaque allergies
    # Split @allergies en un array de valeurs
    # pour chaque allergie
    # En fonction de la clé allergies, convertie en minuscules, on accède au dictionnaire
    # j'obtiens une liste des forbidden_ingredients, sous la forme d'un array
    # Pour chaque forbidden_ingredient, each
    # @meals = Meal.where("ingredients ~* ?", forbidden_ingredient)
