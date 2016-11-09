class ChangeDataType < ActiveRecord::Migration[5.0]
  def change
  	change_column :forms, :mobile, :string
  end
end
