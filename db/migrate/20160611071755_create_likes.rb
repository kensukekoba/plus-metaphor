class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :user, index: true
      t.references :metaphor, index: true

      t.timestamps null: false
      
      t.index [:user_id, :metaphor_id], unique: true
    end
  end
end
