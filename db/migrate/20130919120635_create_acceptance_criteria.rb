class CreateAcceptanceCriteria < ActiveRecord::Migration
  def change
    create_table :acceptance_criteria do |t|
      t.text :description
      t.string :state
      t.references :user_story, index: true

      t.timestamps
    end
  end
end
