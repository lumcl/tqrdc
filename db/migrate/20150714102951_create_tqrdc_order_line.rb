class CreateTqrdcOrderLine < ActiveRecord::Migration
  def change
    create_table :tqrdc_order_line do |t|
      t.integer :order_id
      t.integer :order_group_id
      t.string :status
      t.integer :qhead_id
      t.float :final_score
      t.float :u1_score
      t.integer :u1_user_id
      t.text :u1_comment
      t.date :u1_sign_date
      t.string :u1_ip
      t.string :u1_role
      t.integer :u1_qline_id
      t.float :u2_score
      t.integer :u2_user_id
      t.text :u2_comment
      t.date :u2_sign_date
      t.string :u2_ip
      t.string :u2_role
      t.integer :u2_qline_id
      t.float :u3_score
      t.integer :u3_user_id
      t.text :u3_comment
      t.date :u3_sign_date
      t.string :u3_ip
      t.string :u3_role
      t.integer :u3_qline_id
      t.float :u4_score
      t.integer :u4_user_id
      t.text :u4_comment
      t.date :u4_sign_date
      t.string :u4_ip
      t.string :u4_role
      t.integer :u4_qline_id

      t.timestamps null: false
    end
    add_index :tqrdc_order_line, :order_id
    add_index :tqrdc_order_line, :order_group_id
    add_index :tqrdc_order_line, :qhead_id
  end
end
