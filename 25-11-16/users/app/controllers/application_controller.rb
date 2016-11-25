class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_filter :configure_permitted_parameters, if: :devise_controller?
	
	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u|
		u.permit(:first_name, :last_name, :middle_name, :gender, :email, :other_email, :address1, :address2, :city, :state, :country, :zip, :phone_no, :cell_no, :fax, :rank_id, :preferred_language, :username, :password, :password_confirmation, :paid_rank_id, :profile_id, :profile_attributes => [:first_name, :last_name, :email, :phone_no, :cell_no, :gender, :education, :address, :fax, :rank_id, :hometown, :story, :movies, :other_emails, :phone_visibility, :address_visibility, :email_visibility, :user_id],:address_attributes => [:address1, :address2, :city, :state, :country, :zip, :fax,:user_id])}  
	end
	def after_sign_out_path_for(resource_or_scope)
	    users_path
	end
 
end
