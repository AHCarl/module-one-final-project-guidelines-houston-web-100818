class CreateBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address1 
      t.string :address2 
      t.string :city
      t.string :state
      t.integer :code
      t.string :country
      t.string :phone
      t.string :website
      t.string :filepath
      t.string :descript
      t.integer :add_user
      t.datetime :last_mod
    end 
  end
end
