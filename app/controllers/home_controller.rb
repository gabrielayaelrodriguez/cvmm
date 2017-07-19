class HomeController < ApplicationController
	before_action :check_session
  def index

  end

  def catch_404
  	  raise ActionController::RoutingError.new(params[:path])
  	end

  private

  #def check_session
  #	if user_signed_in?
  #  	redirect_to user_virtual_machines_path(current_user)
  #  end
  #end

	def check_session
		if user_signed_in?
			if current_user.admin?
				redirect_to admin_dashboard_index_path
			else
				redirect_to user_dashboard_index_path
			end
		end
  	end


end
