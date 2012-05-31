class AddBfbIdToAffiliateDetails < ActiveRecord::Migration
  def change
    add_column :affiliate_details, :bfb_id, :integer

  end
end
