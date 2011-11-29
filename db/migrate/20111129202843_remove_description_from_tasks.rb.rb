class RemoveDescriptionFromTasks < ActiveRecord::Migration
  def self.up
    remove_column :tasks, :description
  end

  def self.down
    add_column :tasks, :description, :string
  end
end
