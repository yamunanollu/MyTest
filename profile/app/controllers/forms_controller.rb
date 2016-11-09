class FormsController < ApplicationController
	def index
	end
	def new
		@form = Form.new
	end
	def create
		@form = Form.new(form_params)
 
        if (@form.save)
           render 'show'
       else
       	  render 'new'
       	end
		
	end
	def show
		@form = Form.find_by[:id]
	end
	private
    def form_params
       params.require(:form).permit(:id, :first_name, :middle_name, :last_name, :gender, :preferred_language, :email, :other_email, :phone, :mobile, :address1, :address2, :fax, :rank, :city, :state, :country, :zip, :username, :password, :password_confirmation, :paid_rank_id)
    end
end
