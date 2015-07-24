class CreateTqrdcOrderGroup < ActiveRecord::Migration
  def change
    create_table :tqrdc_order_group do |t|
      t.integer :order_id
      t.integer :group_id
      t.string :status
      t.float :total

      t.timestamps null: false
    end
    add_index :tqrdc_order_group, :order_id
    add_index :tqrdc_order_group, :group_id
  end
end
