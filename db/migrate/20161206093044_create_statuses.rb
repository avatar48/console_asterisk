class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
      t.string :image
      t.integer :delay

      t.timestamps null: false
    end
  end
end
