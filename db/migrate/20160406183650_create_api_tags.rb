class CreateApiTags < ActiveRecord::Migration
  def change
    create_table :apitags do |t|
      t.belongs_to :api, null: false
      t.belongs_to :tag, null: false

      t.timestamps null: false
    end
  end
end
