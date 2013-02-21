class AddSubCommissionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sub_commission, :decimal

  end
end
