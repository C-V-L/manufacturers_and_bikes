class CreateBike < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :name
      t.integer :wheelsize
      t.boolean :carbon
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
