class AddAdminflagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :adminflag, :boolean, default: false
  end
end
