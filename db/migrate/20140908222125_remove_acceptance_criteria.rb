class RemoveAcceptanceCriteria < ActiveRecord::Migration
  def change
    drop_table :acceptance_criteria
  end
end
