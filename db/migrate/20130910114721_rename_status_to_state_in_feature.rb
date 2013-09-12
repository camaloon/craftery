class RenameStatusToStateInFeature < ActiveRecord::Migration
  def change
    rename_column :features, :status, :state
  end
end
