class ExpenseItem < ActiveRecord::Base
	
	# Active Record relations
	belongs_to :monthly_report

end
