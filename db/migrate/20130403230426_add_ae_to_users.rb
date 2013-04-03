class AddAeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_executive_id, :integer

  end
end
