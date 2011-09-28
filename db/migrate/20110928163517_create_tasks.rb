class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string   :description
      t.datetime :start_time
      t.datetime :end_time
      t.string   :external_link

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
