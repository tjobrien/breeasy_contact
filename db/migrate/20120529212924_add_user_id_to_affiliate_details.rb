class AddUserIdToAffiliateDetails < ActiveRecord::Migration
  def change
    add_column :affiliate_details, :user_id, :integer
    add_column :affiliate_details, :country, :string
    add_column :affiliate_details, :phone, :string
    add_column :affiliate_details, :title, :string

  end
end
