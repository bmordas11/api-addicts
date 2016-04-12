class RemovesTitleFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :title, :string, null: false
  end
end
