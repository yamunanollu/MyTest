class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.text :address1      
      t.text :address2      
      t.string :city     
      t.string :state      
      t.string :country      
      t.integer :zip
      t.integer :fax 

      t.timestamps
    end
  end
end
