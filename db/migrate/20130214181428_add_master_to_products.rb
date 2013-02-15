class AddMasterToProducts < ActiveRecord::Migration
  def change
    add_column :products, :master, :boolean, :default => false

  end
end
