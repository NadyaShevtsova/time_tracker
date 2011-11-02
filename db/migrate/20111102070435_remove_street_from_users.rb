class RemoveStreetFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :street
  end

  def self.down
    add_column :users, :street, :string
  end
end
