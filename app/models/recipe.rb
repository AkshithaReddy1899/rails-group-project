class Recipe < ApplicationRecord
  validates :name , presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :public , presence: true, inclusion: { in: [true, false] }
  validates_associated :recipe_foods


  belongs_to :user
  has_many :recipe_foods, dependent: :destroy


  def is_public?
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    # if true return @recipe.public
  end

  def description_substr
    @recipe = Recipe.find(id)
    @recipe.description.truncate(88)
  end

end
