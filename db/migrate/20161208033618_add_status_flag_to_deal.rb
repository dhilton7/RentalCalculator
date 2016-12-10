class AddStatusFlagToDeal < ActiveRecord::Migration
  def change
  	add_column :deals, :sold_price, :integer, null: false, default: 0
  	add_column :deals, :status, :string, null: false, default: 'prospect'
  end
end
