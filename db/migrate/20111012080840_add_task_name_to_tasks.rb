class AddTaskNameToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :task_name, :string
  end

  def self.down
    remove_column :tasks, :task_name
  end
end
