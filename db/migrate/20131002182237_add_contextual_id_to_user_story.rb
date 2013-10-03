class AddContextualIdToUserStory < ActiveRecord::Migration
  def change
    add_column :user_stories, :contextual_id, :integer
  end
end
