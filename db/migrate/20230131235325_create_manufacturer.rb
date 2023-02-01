class CreateManufacturer < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.integer :employees
      t.boolean :domestic
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
