class AddNameToCheckers < ActiveRecord::Migration
  def change
    add_column :checkers, :name, :text
  end
end
