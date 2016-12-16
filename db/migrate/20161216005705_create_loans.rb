class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
    	t.integer :amount, null: false, default: 0
    	t.integer :down_payment, null: false, default: 0
    	t.integer :points, null: true
    	t.integer :ammortization, null: false, default: 0
        t.integer :fees, null: false, default: 0
    	t.decimal :interest_rate, precision: 4, scale: 2, null: false, default: 0 
    	t.boolean :interest_only, null: false, default: false
    	t.references :deal, index: true
		t.timestamps null: false
    end
  end
end
