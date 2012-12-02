class AddProductIdToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :program_id, :integer
    rename_column :urls, :product, :program_description

  end
end
