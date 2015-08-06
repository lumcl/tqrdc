class AddColumnTqrdcSupplier < ActiveRecord::Migration
  def change
    add_column :tqrdc_supplier, :vname, :string
    add_column :tqrdc_supplier, :email, :string
    add_column :tqrdc_supplier, :mtype, :string
  end
end
