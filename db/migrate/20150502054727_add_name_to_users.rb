class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :user, :username, :string
    add_column :user, :role, :string
    add_column :user, :employee_id, :integer
    add_column :user, :company_id, :integer
    add_index :user, :username, unique: true

  end
end
