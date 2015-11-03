class CreateTqrdcOrderFile < ActiveRecord::Migration
  def change
    create_table :tqrdc_order_file do |t|
      t.integer :order_id
      t.string :filename
      t.attachment :tqrdc
      t.text :remark
      t.integer :owner_id
      t.integer :creator_id
      t.integer :updater_id

      t.timestamps null: false
    end
  end
end
