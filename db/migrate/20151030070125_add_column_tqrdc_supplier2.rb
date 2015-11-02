class AddColumnTqrdcSupplier2 < ActiveRecord::Migration
  def change
    add_column :tqrdc_supplier, :disty , :string
    add_column :tqrdc_supplier, :maker, :string
  end
end
