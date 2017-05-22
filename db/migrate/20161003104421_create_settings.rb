class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :config
      t.text :name_option
      t.text :value

      t.timestamps null: false
    end
  end
end
