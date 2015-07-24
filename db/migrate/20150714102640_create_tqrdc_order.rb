class CreateTqrdcOrder < ActiveRecord::Migration
  def change
    create_table :tqrdc_order do |t|
      t.integer :supplier_id
      t.string :period
      t.string :status
      t.string :territory
      t.float :total

      t.timestamps null: false
    end
    add_index :tqrdc_order, :supplier_id
    add_index :tqrdc_order, :period
    add_index :tqrdc_order, :territory
  end
end
