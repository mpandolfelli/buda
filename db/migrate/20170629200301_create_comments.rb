class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :comment
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
