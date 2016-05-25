class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.string :title
      t.text :link
      t.string :category

      t.timestamps null: false
      t.index [:user_id, :created_at]
    end
  end
end
