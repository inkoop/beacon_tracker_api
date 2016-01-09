class Api::V1::BaseController < RocketPants::Base

  version 1

  before_action :get_user_from_token!

  private

    def get_user_from_token!
      api_key = params[:api_key].strip
      head :unauthorized unless @user = User.find_by(api_key: api_key)
    end

end
