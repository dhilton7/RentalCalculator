class CreateMonthlyReports < ActiveRecord::Migration
  def change
    create_table :monthly_reports do |t|
    	t.string :month_year, null: true
    	t.references :property, index: true
    	t.timestamps 	null: false
    end
  end
end
