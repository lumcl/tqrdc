class CreateTqrdcGroup < ActiveRecord::Migration
  def change
    create_table :tqrdc_group do |t|
      t.string :name
      t.text :description
      t.float :score
      t.integer :owner_id
      t.integer :creator_id
      t.integer :updater_id
      t.timestamps null: false
    end
    add_index :tqrdc_group, :name
  end
end
