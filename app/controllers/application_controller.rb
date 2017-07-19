class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	#def after_sign_in_path_for(resource)
  	#	user_dashboard_index_path(current_user)
	#end


	def after_sign_in_path_for(resource)
			if current_user.admin?
				admin_dashboard_index_path
			else
				user_dashboard_index_path
			end
  	end

	rescue_from CanCan::AccessDenied do |exception|
	    respond_to do |format|
	      format.json { head :forbidden }
	      format.html { redirect_to main_app.root_url, :alert => exception.message }
	    end
	  end

	rescue_from ActionController::RoutingError do |exception|
		respond_to do |format|
	      format.json { head :forbidden }
	      format.html { redirect_to main_app.root_url, :alert => exception.message + " has not been found." }
	    end 
	end
end
