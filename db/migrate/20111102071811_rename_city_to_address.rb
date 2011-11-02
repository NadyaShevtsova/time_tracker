class RenameCityToAddress < ActiveRecord::Migration
  def self.up
    rename_column :users, :city, :address
  end

  def self.down
    rename_column :users, :address, :city
  end
end
