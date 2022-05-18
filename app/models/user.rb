class User < ApplicationRecord
  validates :name, presence: true, length: { in: 5..20 }
  has_many :recipes, dependent: :destroy
end
