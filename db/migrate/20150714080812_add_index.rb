class AddIndex < ActiveRecord::Migration
  def change
    #add_index :tqrdc_qhead, :name ,:name => 'tqrdc_head_idx1'
    #add_index :tqrdc_qhead, [:group_id,:name]
    add_index :tqrdc_qhead, :name
    add_index :tqrdc_qhead, :group_id
  end
end
