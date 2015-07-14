class CreateTqrdcQhead < ActiveRecord::Migration
  def change
    create_table :tqrdc_qhead do |t|
      t.string :name
      t.text :description
      t.integer :group_id
      t.float :score
      t.string :remark
      t.integer :owner_id
      t.integer :creator_id
      t.integer :updater_id

      t.timestamps null: false
    end
  end
end
