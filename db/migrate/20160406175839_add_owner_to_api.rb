class AddOwnerToApi < ActiveRecord::Migration
  def change
    add_reference :apis, :user, index: true, null: false
  end
end
