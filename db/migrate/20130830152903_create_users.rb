class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username, limit: 32
      t.string :password
      t.references :role, index: true

      t.timestamps
    end
  end
end
