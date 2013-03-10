class CreateContactLists < ActiveRecord::Migration
  def change
    create_table :contact_lists do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
