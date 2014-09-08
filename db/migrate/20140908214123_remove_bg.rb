class RemoveBg < ActiveRecord::Migration
  def change
    drop_table :business_goals
  end
end
