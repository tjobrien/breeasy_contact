class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :new
      t.decimal :renewal
      t.boolean :active
      t.integer :interval
      t.integer :plan_id

      t.timestamps
    end
  end
end
