class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.integer :brewery_id
      t.string :name
      t.integer :style_id
      t.float :abv
      t.float :ibu
      t.string :descript
     end
  end
 end