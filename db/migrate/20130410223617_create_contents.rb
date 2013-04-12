class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :header_1
      t.text :paragraph_1
      t.string :sub_head_2
      t.text :paragraph_2
      t.string :sub_head_3
      t.text :paragraph_3
      t.integer :user_id
      t.timestamps
    end
  end
end
