class Recipe < ActiveRecord::Base
  # Associations
  has_many :ingredients
  accepts_nested_attributes_for :ingredients

  # Validations

end
