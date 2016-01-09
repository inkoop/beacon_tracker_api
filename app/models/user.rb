class User < ActiveRecord::Base
  validates :api_key, presence: true, uniqueness: true
end
