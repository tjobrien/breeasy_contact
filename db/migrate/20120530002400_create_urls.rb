class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.integer :user_id
      t.string :product
      t.string :url

      t.timestamps
    end
  end
end
