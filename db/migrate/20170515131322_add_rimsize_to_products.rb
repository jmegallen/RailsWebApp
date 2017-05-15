class AddRimsizeToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :rimsize, :string
  end
end
