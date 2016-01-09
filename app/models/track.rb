class Track < ActiveRecord::Base
  belongs_to :category

  validates :start_time, :end_time, :category_id, presence: true
end
