class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :programs
  has_one_attached :profile_picture
  validates :first_name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def adaptation(poids, taille, age, sexe, activite)
  #   if sexe == "femme"
  #     @mb = (655 + (9.6 * poids) + (1.8 * taille) - (4.7 * age)) * activite
  #   else
  #     @mb = (66 + (13.7 * poids) + (5 * taille) - (6.5 * age)) * activite
  #   end
  # end

  # def choice(choice)
  #   case choice
  #   when "loose weight"
  #     @objt = @mb - 500
  #   when "weight maintenance"
  #     @objt = @mb
  #   when "gain weight"
  #     @objt = @mb + 500
  #   end
  # end
end
