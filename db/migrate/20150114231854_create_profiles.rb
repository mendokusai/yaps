class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :created
      t.string :gold_creddits
      t.string :link_karma
      t.string :comment_karma
      t.boolean :over_18
      t.boolean :is_gold
      t.boolean :is_mod
      t.string :user_id

      t.timestamps null: false
    end
  end
end
