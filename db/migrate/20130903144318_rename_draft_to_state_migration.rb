class RenameDraftToStateMigration < ActiveRecord::Migration
  def change
    change_table :features do |t|
      t.remove :draft
      t.string :status
    end

    change_table :users do |t|
      t.remove :username
      t.string :username
    end
  end
end
