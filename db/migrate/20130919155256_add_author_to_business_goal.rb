class AddAuthorToBusinessGoal < ActiveRecord::Migration
  def change
    add_reference :business_goals, :author, index: true
  end
end
