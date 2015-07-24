class CreateTqrdcSupplier < ActiveRecord::Migration
  def change
    create_table :tqrdc_supplier do |t|
      t.string :supplier
      t.integer :commodity_mgr_id
      t.string :start_period
      t.string :end_period

      t.timestamps null: false
    end
    add_index :tqrdc_qline, :qhead_id
    add_index :tqrdc_supplier, :supplier
  end
end
