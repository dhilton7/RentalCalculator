class AddListPriceToDeal < ActiveRecord::Migration
  def change
  	add_column :deals, :list_price, :integer, null: false, default: 0
  end
end
