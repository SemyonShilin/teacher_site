class CreateAdminUsersAdminRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_users_admin_roles, id: false do |t|
      t.belongs_to :admin_user, foreign_key: { null: false, on_delete: :cascade }
      t.belongs_to :admin_role, foreign_key: { null: false, on_delete: :cascade }
      t.timestamps null: false
    end

    add_index :admin_users_admin_roles, [:admin_user_id, :admin_role_id], unique: true, name: 'index_unique_admin_users_admin_roles'
  end
end