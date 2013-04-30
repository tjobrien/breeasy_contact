class AddActiveToContents < ActiveRecord::Migration
  def change
    add_column :contents, :active, :boolean, :default => :false

  end
end
