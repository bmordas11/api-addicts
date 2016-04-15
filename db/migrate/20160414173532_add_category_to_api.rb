class AddCategoryToApi < ActiveRecord::Migration
  def change
    add_column :apis, :category, :string
  end
end
