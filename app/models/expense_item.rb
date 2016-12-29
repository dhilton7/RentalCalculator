class ExpenseItem < ActiveRecord::Base
	
	# Active Record relations
	belongs_to :monthly_report

	# Validations
	validates :name, :amount, presence: true

	def amount=(value)
		super value.to_f * 100
	end

	def amount
		super.to_i / 100.00
	end

end
