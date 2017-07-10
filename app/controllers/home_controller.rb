class HomeController < ApplicationController
	before_action :check_session
  def index

  end

  private

  def check_session
  	if user_signed_in?
    	redirect_to user_dashboard_index_path(current_user)
    end
  end

end
