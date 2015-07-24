class CreateTqrdcFlow < ActiveRecord::Migration
  def change
    create_table :tqrdc_flow do |t|
      t.string :name
      t.text :description
      t.integer :qhead_id
      t.string :role
      t.string :territory
      t.integer :user_id
      t.integer :seq
      t.integer :next_seq
      t.integer :owner_id
      t.integer :creator_id
      t.integer :updater_id

      t.timestamps null: false
    end
    add_index :tqrdc_flow , :qhead_id
  end
end
