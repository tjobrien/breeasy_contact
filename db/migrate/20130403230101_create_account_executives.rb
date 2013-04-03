class CreateAccountExecutives < ActiveRecord::Migration
  def change
    create_table :account_executives do |t|
      t.string :name
      t.string :email
      t.boolean :active, :default => :true
      t.string :phone
      t.string :skype

      t.timestamps
    end
  end
end
