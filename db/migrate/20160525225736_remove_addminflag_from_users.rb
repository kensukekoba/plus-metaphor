class RemoveAddminflagFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :addminflag, :boolean
  end
end
