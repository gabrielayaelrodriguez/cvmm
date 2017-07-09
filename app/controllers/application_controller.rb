class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)
  		users_dashboard_index_path
	end

	rescue_from CanCan::AccessDenied do |exception|
	    respond_to do |format|
	      format.json { head :forbidden }
	      format.html { redirect_to main_app.root_url, :alert => exception.message }
	    end
	  end
end
