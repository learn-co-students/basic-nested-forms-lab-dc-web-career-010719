class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients
  before_save :remove_blank_ingredients

  def remove_blank_ingredients
    self.ingredients = self.ingredients.select {|i| !i.name.blank? && !i.quantity.blank?}
  end
  
end
