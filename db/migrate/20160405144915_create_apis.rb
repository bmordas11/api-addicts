class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
      t.string  :name,          null: false, unique: true
      t.string  :url,           null: false, unique: true
      t.text    :description,   null: false
      t.boolean :paid,          null: false

      t.timestamps null: false
    end
  end
end
