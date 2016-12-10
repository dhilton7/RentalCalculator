class CreateMonthlyReports < ActiveRecord::Migration
  def change
    create_table :monthly_reports do |t|
    	t.date 			:start_date, null: true
    	t.date 			:end_date, null: true
    	t.references 	:deal, index: true
      t.timestamps 	null: false
    end
  end
end
