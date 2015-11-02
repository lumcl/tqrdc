class AddColumnTqrdcSupplier3 < ActiveRecord::Migration
  def change
    add_column :tqrdc_supplier, :vtext , :string
  end
end
