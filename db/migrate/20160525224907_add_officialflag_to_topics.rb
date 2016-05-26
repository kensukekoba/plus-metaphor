class AddOfficialflagToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :officialflag, :boolean, default: false
  end
end
