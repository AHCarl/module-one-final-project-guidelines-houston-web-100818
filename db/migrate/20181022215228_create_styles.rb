class CreateStyles < ActiveRecord::Migration[5.0]
  def change
    create_table :styles do |t|
      t.string :style_name
    end
  end
 end
