class CreateApi < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string  :name,        null: false
      t.string  :url,         null: false
      t.text    :description, null: false

      t.timestamps null: false
    end
  end
end
