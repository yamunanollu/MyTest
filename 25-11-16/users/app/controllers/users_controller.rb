class UsersController < ApplicationController
	def index		
		@users = User.all	    
	end	

	def new
		@user = User.new
		@user.build_profile
		@user.contacts.build		
	end
        
    def auth
    	@profile = Profile.find_by user_id: current_user.id
    	render 'show'
    end	
    
	def create
		@user = User.new(user_params)
		if @user.save 
			@profile= Profile.where(user_id: @user.id).first
    		render 'profile'
        else
       	  render 'new'
       	end		
	end	

	def show
		@us = User.find_by(username: user_params[:username] ,password: user_params[:password])
	end

	private
    def user_params
       params.require(:user).permit(:first_name, :middle_name, :last_name, :gender, :preferred_language, :email, :other_email, :phone, :mobile, :address1, :address2, :fax, :rank_id, :city, :state, :country, :zip, :username, :password, :password_confirmation, :paid_rank_id, :profile_id, :profile_attributes => [:first_name, :phone, :email, :last_name, :fax, :cell, :address, :rank_id, :gender, :education, :hometown, :story, :movies, :phone_visibility, :email_visibility, :address_visibility, :other_emails, :user_id])
       
    end
    
end
