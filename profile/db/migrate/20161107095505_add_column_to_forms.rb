class AddColumnToForms < ActiveRecord::Migration[5.0]
  def change
  	add_column :forms, :gender, :string
  	add_column :forms, :preferred_language, :string
  	add_column :forms, :email, :string
  	add_column :forms, :other_email, :string
  	add_column :forms, :phone, :integer
  	add_column :forms, :mobile, :integer
  	add_column :forms, :fax, :string
  	add_column :forms, :rank_id, :string
  	add_column :forms, :address1, :text
  	add_column :forms, :address2, :text
  	add_column :forms, :city, :string
  	add_column :forms, :state, :string
  	add_column :forms, :country, :string
    add_column :forms, :zip, :integer
    add_column :forms, :username, :string
    add_column :forms, :password, :string
    add_column :forms, :password_confirmation, :string
    add_column :forms, :paid_rank_id, :integer
  end
end
