class FinancialItem < ActiveRecord::Base

	# Active Record relations
	belongs_to :monthly_report

	# Scopes
	scope :income, -> { where(income:true) }
	scope :expense, -> { where.not(income:true) }

	# Model functions

	# Return the effective value on the bottom line (negative value when expense)
	def effective_value
		income? ? amount : amount * -1
	end

end
