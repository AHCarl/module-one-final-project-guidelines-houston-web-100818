class CreateStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :styles do |t|
      t.integer :cat_id
      t.string :style_name
      t.datetime :last_mod
    end 
  end
end
