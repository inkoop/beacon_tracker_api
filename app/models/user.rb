class User < ActiveRecord::Base
  has_many :tracks
  
  validates :api_key, presence: true, uniqueness: true
end
