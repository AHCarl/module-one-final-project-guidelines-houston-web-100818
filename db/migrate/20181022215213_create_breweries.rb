class CreateBreweries < ActiveRecord::Migration[5.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address1
      t.string :city
      t.string :state
      t.integer :code
      t.string :country
      t.string :website
      t.string :descript
    end
  end
 end
