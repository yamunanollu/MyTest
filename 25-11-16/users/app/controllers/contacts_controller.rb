class ContactsController < ApplicationController
	def index
		@contacts = current_user.contacts
		if @contacts.present?
			render "index"
		else
			flash[:notice] = "Contacts not exists"
			render "nocontact"
		end
	end

	def new
		@contact = Contact.new()
	end

	def edit
       @contact = Contact.find(params[:id])
    end

	def create		
		@contact = Contact.new(contact_params)
		@contact.user_id = current_user.id
		if @contact.save            
           render "show"
        else
       	  render 'new'
       	end		
	end
	
    def show
    	@contact = Contact.find(params[:id])
    end

    def destroy
        @contact = Contact.find(params[:id])
        @contact.destroy 
        redirect_to contacts_path
    end

    def nocontact
    end

	private
	
	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :contact_type, :address1, :address2, :city, :phone_number, :state, :birthday, :user_id)
	end
end