class CreateBusinessGoals < ActiveRecord::Migration
  def change
    create_table :business_goals do |t|
      t.text :description
      t.string :state
      t.references :feature, index: true

      t.timestamps
    end
  end
end
