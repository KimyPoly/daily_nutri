class MealsController < ApplicationController
  before_action :set_meal, only: %i[show]
  before_action :set_program, only: %i[index]

  def index
    @meals = Meal.all
    @min_calorie = @meals.map { |meal| meal.calories }.min
    set_program_options

    @calories_goal = @program.calories_goal

    nb_of_meals = (@nb_of_meals_by_day * @nb_of_days) + 4

    if @diet == "Omnivorous" && @allergies == "None"
      @meals = Meal.order('RANDOM()').limit(nb_of_meals)

    elsif @diet == "Omnivorous"
      @meals = Meal.order('RANDOM()').limit(nb_of_meals)
      @allergies = @allergies.split(",")

      conditions = []

      @allergies.each do |allergy|
        downcase_allergy = allergy.downcase
        forbidden_ingredients = allergies_dictionary[downcase_allergy.singularize.to_s]
        next unless forbidden_ingredients

        forbidden_ingredients.each do |forbidden_ingredient|
          conditions << "ingredients !~* '#{forbidden_ingredient}'"
        end
      end
      @meals = @meals.where(conditions.join(' AND ')) unless conditions.empty?

    else
      @meals = Meal.where("diet ~* ?", @diet).order('RANDOM()').limit(@nb_of_meals)
      @allergies = @allergies.split(",")

      conditions = []

      @allergies.each do |allergy|
        downcase_allergy = allergy.downcase
        forbidden_ingredients = allergies_dictionary[downcase_allergy.singularize.to_s]
        next unless forbidden_ingredients

        forbidden_ingredients.each do |forbidden_ingredient|
          conditions << "ingredients !~* '#{forbidden_ingredient}'"
        end
      end
      @meals = @meals.where(conditions.join(' AND ')) unless conditions.empty?
    end
    case @goal
    when "Lose weight"
      @meals = @meals.where("calories < ?", 400)
    when "Weight maintenance"
      @meals
    when "Gain weight"
      @meals = @meals.where("calories > ?", 400)
    end
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
          meal: meal
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


  def set_program_options
    @goal = @program.goal
    @diet = @program.diet
    @allergies = @program.allergies
    @nb_of_days = @program.nb_of_days
    @nb_of_meals_by_day = @program.nb_of_meals_by_day
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
        "Peanuts", "peanut", "Peanut", "peanuts"
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
