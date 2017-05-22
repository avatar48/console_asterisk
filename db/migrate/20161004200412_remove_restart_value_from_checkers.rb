class RemoveRestartValueFromCheckers < ActiveRecord::Migration
  def change
    remove_column :checkers, :restart_value, :boolean
  end
end
