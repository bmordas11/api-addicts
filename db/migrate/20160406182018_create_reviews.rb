class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string     :title, null: false
      t.text       :body, null: false
      t.integer    :rating, null: false
      t.belongs_to :user, null: false
      t.belongs_to :api, null: false
      t.timestamps null: false
    end
  end
end
