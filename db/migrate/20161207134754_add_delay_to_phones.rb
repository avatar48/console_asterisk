class AddDelayToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :delay, :integer
  end
end
