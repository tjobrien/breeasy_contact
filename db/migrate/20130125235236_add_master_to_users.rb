class AddMasterToUsers < ActiveRecord::Migration
  def change
    add_column :users, :master, :boolean

  end
end
