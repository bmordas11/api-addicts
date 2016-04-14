class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, null: false
      t.references :api, null: false
      t.boolean :user_vote, null: false

      t.timestamps null: false
    end
  end
end
