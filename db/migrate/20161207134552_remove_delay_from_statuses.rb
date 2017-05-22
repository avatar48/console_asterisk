class RemoveDelayFromStatuses < ActiveRecord::Migration
  def change
    remove_column :statuses, :delay, :integer
  end
end
