class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
      t.references :author, index: true
      t.references :persona, index: true
      t.text :desire
      t.text :benefit
      t.references :feature, index: true

      t.timestamps
    end
  end
end
