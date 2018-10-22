class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.integer :brewery_id
      t.string :name
      t.integer :cat_id
      t.integer :style_id
      t.float :abv
      t.float :ibu
      t.float :srm
      t.integer :upc
      t.string :filepath
      t.string :descript
      t.integer :add_user
      t.datetime :last_mod
    end
  end
end
