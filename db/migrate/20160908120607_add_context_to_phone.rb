class AddContextToPhone < ActiveRecord::Migration
  def change
    add_reference :phones, :context, index: true, foreign_key: true
  end
end
