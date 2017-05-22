class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :number
      t.string :password
      t.string :context
      t.integer :pickupgroup
      t.integer :callgroup
      t.string :callerid

      t.timestamps null: false
    end
  end
end
