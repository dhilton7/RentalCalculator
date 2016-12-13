class CreateIncomeItems < ActiveRecord::Migration
  def change
    create_table :income_items do |t|
    	t.string :name, null: false
    	t.integer :amount, null: false, default: 0
    	t.references :monthly_report, index: true
    	t.timestamps null: false
    end
  end
end
