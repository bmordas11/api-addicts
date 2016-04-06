class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user
      t.belongs_to :api
      t.string     :title
      t.text       :body
      t.integer    :up_vote
      t.integer    :down_vote
    end
  end
end
