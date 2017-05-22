class AddValueToCheckers < ActiveRecord::Migration
  def change
    add_column :checkers, :value, :boolean
  end
end
