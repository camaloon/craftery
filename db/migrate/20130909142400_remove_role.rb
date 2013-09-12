class RemoveRole < ActiveRecord::Migration
  def change
    drop_table :roles
    remove_reference :users, :role
  end
end
