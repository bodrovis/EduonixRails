class AddPriceToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :price, :decimal, precision: 5, scale: 2
  end
end
