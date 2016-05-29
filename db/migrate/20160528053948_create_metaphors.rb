class CreateMetaphors < ActiveRecord::Migration
  def change
    create_table :metaphors do |t|
      t.references :user, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
      t.index [:user_id, :created_at]
      t.index [:topic_id, :created_at]
    end
  end
end
