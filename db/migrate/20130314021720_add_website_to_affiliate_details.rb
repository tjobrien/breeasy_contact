class AddWebsiteToAffiliateDetails < ActiveRecord::Migration
  def change
    add_column :affiliate_details, :website, :string

  end
end
