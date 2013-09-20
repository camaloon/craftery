class AddAuthorToAcceptanceCriterion < ActiveRecord::Migration
  def change
    add_reference :acceptance_criteria, :author, index: true
  end
end
