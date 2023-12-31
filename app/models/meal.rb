class Meal < ApplicationRecord
  has_many :meal_assignements, dependent: :destroy
  has_many :programs, through: :meal_assignements
  before_save :fix_meal_type

  def fix_meal_type
    types = meal_type
    types = types.split(",")
    breakfast_types = "snack,breakfast".split(",")
    types.map do |type|
      if breakfast_types.include?(type)
        self.meal_type = "breakfast"
      else
        self.meal_type = "dish"
      end
    end
  end
end
