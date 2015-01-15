class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :subreddits
      t.string :user_id

      t.timestamps null: false
    end
  end
end
