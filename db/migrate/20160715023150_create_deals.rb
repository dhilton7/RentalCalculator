class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
    	t.string :address
    	t.string :city
    	t.string :state
    	t.string :zip
      t.string :neighborhood_scout
    	t.integer :purchase_price, null: false, default: 0
    	t.integer :arv, null: false, default: 0
    	t.integer :closing_costs, null: false, default: 0
    	t.integer :estimated_repairs, null: false, default: 0
    	t.integer :down_payment, null: false, default: 0
    	t.decimal :interest_rate, precision: 4, scale: 2, null: false, default: 0
    	t.integer :loan_points, null: false, default: 0
    	t.integer :loan_years, null: false, default: 0
    	t.integer :gross_rent, null: false, default: 0
    	t.integer :other_income, null: false, default: 0
    	t.integer :electricity, null: false, default: 0
    	t.integer :water_sewer, null: false, default: 0
    	t.decimal :pmi, precision: 10, scale: 2, null: false, default: 0
    	t.decimal :insurance, precision: 10, scale: 2, null: false, default: 0
    	t.decimal :property_tax, precision: 10, scale: 2, null: false, default: 0
    	t.integer	:other_expenses, null: false, default: 0
    	t.integer :vacancy, null: false, default: 0
    	t.integer :repairs_maintenance, null: false, default: 0
    	t.integer :cap_ex, null: false, default: 0
    	t.integer :property_management, null: false, default: 0

      t.timestamps null: false
    end
  end
end
