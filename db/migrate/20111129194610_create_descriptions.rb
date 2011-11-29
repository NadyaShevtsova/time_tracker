class CreateDescriptions < ActiveRecord::Migration
  def self.up
    create_table :descriptions do |t|
      t.text    :description_name, :null => false 
      t.integer :task_id, :null => false 

      t.timestamps
    end
  end

  def self.down
    drop_table :descriptions
  end
end
