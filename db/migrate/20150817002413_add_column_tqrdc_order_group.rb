class AddColumnTqrdcOrderGroup < ActiveRecord::Migration
  def change
    add_column :tqrdc_order, :u1_tot, :integer
    add_column :tqrdc_order, :u2_tot , :integer
    add_column :tqrdc_order, :u3_tot , :integer
    add_column :tqrdc_order, :u4_tot , :integer
    add_column :tqrdc_order_group, :u1_tot, :integer
    add_column :tqrdc_order_group, :u2_tot, :integer
    add_column :tqrdc_order_group, :u3_tot, :integer
    add_column :tqrdc_order_group, :u4_tot, :integer
  end
end
