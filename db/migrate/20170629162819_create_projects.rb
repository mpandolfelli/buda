class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :client_id
      t.integer :assigned_id
      t.integer :status_id
      t.datetime :deadline
      t.datetime :registered
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
