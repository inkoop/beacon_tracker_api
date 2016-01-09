class Track < ActiveRecord::Base
  belongs_to :category

  validates :start_time, :category_id, :user_id, presence: true

  before_update do
    if start_time.present? && end_time.present?
      self.time_tracked_in_minutes = ( (end_time - start_time) / 60 ).round
    end
  end
end
