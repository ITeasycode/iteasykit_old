class AddRoleToIteasykitUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :iteasykit_users, :role, :string
  end
end
