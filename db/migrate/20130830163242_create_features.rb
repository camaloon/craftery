class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.text :description
      t.references :owner, index: true
      t.boolean :draft
      t.references :project, index: true

      t.timestamps
    end
  end
end
