class Api::V1::TracksController < Api::V1::BaseController

  def index
    tracking_data = {
      today: "10 minutes",
      week: "25 hours",
      month: "180 hours"
    }
    expose tracking_data
  end

  def create
    if start_time.present?
      @user.tracks.create start_time: start_time, category_id: category.try(:id)
    elsif end_time.present?
      @user.tracks.last.update end_time: end_time
    end
  end

  private

    def start_time
      params[:start_time]
    end

    def end_time
      params[:end_time]
    end

    def category
      @category ||= Category.find_by(name: params[:category])
    end

end
