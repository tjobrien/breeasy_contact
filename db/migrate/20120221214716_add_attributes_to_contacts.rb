class AddAttributesToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :breeasy, :boolean
    add_column :contacts, :marketing, :boolean
    add_column :contacts, :white_label, :boolean
    add_column :contacts, :contact_method, :string
    add_column :contacts, :referral, :boolean
  
  
  end

  def self.down
    remove_column :contacts, :contact_method
    remove_column :contacts, :breeasy
    remove_column :contacts, :marketing
    remove_column :contacts, :white_label
    remove_column :contacts, :referral
  end
end
