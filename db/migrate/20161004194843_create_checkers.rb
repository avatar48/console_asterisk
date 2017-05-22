class CreateCheckers < ActiveRecord::Migration
  def change
    create_table :checkers do |t|
      t.boolean :value
      t.text :name

      t.timestamps null: false
    end
  end
end
