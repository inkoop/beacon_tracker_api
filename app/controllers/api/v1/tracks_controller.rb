class Api::V1::TracksController < Api::V1::BaseController

  def index
    tracking_data = {
      today: time_format(today_tracked_time),
      week: time_format(current_week_tracked_time),
      month: time_format(current_month_tracked_time)
    }
    expose tracking_data
  end

  def create
    case params[:track]
    when "0"
      @user.tracks.create start_time: Time.now, category_id: category.try(:id)
    when "1"
      @user.tracks.last.update end_time: Time.now
    end
  end

  private

    def category
      @category ||= Category.find_by(name: params[:category])
    end

    def today_tracked_time
      @user.tracks.where(
        "start_time >= ? AND end_time <= ?", 
        Date.today.beginning_of_day, 
        Date.today.end_of_day
      ).sum(:time_tracked_in_minutes)
    end

    def current_week_tracked_time
      @user.tracks.where(
        "start_time >= ? AND end_time <= ?", 
        Date.today.beginning_of_week, 
        Date.today.end_of_week
      ).sum(:time_tracked_in_minutes)
    end

    def current_month_tracked_time
      @user.tracks.where(
        "start_time >= ? AND end_time <= ?", 
        Date.today.beginning_of_month, 
        Date.today.end_of_month
      ).sum(:time_tracked_in_minutes)
    end

    def time_format time_in_minutes
      if time_in_minutes < 120
        "#{time_in_minutes} minutes"
      else
        "#{(time_in_minutes/60.to_f).round(1)} hours"
      end
    end

end
