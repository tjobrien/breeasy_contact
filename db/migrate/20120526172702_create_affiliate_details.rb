class CreateAffiliateDetails < ActiveRecord::Migration
  def change
    create_table :affiliate_details do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :address
      t.string :city
      t.string :state
      t.string :post_code
      t.string :url
      t.string :affiliate_code
      t.string :affiliate_url
      t.boolean :accepted_terms, :default => false

      t.timestamps
    end
  end
end
