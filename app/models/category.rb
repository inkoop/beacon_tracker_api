class Category < ActiveRecord::Base
  has_many :tracks

  validates :name, presence: true, uniqueness: true
end
