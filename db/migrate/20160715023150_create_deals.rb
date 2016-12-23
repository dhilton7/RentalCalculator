class CreateDeals < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :status, null: false, default: 'prospect'
      t.text :notes, null: true
      t.timestamps null: false
    end
    
    create_table :deals do |t|
    	t.integer :purchase_price, null: false, default: 0
      t.integer :list_price, null: false, default: 0
      t.integer :sold_price, null: false, default: 0
    	t.integer :arv, null: false, default: 0
    	t.integer :closing_costs, null: false, default: 0
    	t.integer :estimated_repairs, null: false, default: 0
    	t.integer :gross_rent, null: false, default: 0
    	t.integer :other_income, null: false, default: 0
    	t.integer :electricity, null: false, default: 0
    	t.integer :water_sewer, null: false, default: 0
    	t.decimal :pmi, precision: 10, scale: 2, null: false, default: 0
    	t.decimal :insurance, precision: 10, scale: 2, null: false, default: 0
    	t.decimal :property_tax, precision: 10, scale: 2, null: false, default: 0
    	t.integer :other_expenses, null: false, default: 0
    	t.integer :vacancy, null: false, default: 0
    	t.integer :repairs_maintenance, null: false, default: 0
    	t.integer :cap_ex, null: false, default: 0
    	t.integer :property_management, null: false, default: 0
      t.boolean :cash_purchase, null: false, default: false
      t.references :property, index: true
      t.timestamps null: false
    end
  end
end
