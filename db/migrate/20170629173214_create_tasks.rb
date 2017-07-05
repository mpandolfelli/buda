class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :assets_id
      t.integer :status_id
      t.datetime :deadline
      t.datetime :registered
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
