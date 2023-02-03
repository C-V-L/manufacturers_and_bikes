class AddManufacturerToBikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :bikes, :manufacturer, foreign_key: true
  end
end
