class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.text :description
      t.string :phone
      t.string :twitter

      t.timestamps
    end
  end
end
