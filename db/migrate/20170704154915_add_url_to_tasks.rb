class AddUrlToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :url, :string
  end
end
