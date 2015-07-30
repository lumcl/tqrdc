class AddTerritoryToTqrdcSupplier < ActiveRecord::Migration
  def change
    add_column :tqrdc_supplier, :territory, :string
  end
end
