class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.text :notes
      t.boolean :active
      t.string :url_path

      t.timestamps
    end
  end
end
