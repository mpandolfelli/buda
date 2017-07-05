class RemoveProjectIdFromStatuses < ActiveRecord::Migration[5.0]
  def change
    remove_column :statuses, :project_id, :integer
  end
end
