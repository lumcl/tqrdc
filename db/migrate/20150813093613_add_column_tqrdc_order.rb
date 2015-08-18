class AddColumnTqrdcOrder < ActiveRecord::Migration
  def change
    add_column :tqrdc_order, :seq, :integer
    add_column :tqrdc_order_line, :seq, :integer
  end
end
