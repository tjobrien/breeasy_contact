class AddBbcToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :bbc, :boolean

  end
end
