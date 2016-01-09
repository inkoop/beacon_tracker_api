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
    
  end

end
