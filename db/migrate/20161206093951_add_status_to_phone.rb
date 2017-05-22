class AddStatusToPhone < ActiveRecord::Migration
  def change
    add_reference :phones, :status, index: true, foreign_key: true
  end
end
