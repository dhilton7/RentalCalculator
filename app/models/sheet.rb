class Sheet < ActiveRecord::Base

	#
	# ACTIVE RECORD RELATIONS
	#
	belongs_to :user
	has_many :entries


	#
	# MODEL FUNCTIONS
	#
	def total_debt
		entries.debt.map(&:amount).reduce(:+) || 0
	end

	def total_credit
		entries.credit.map(&:amount).reduce(:+) || 0
	end

	def operating_expenses
		entries.operating_expense.map(&:amount).reduce(:+) || 0
	end

	def noi
		total_credit - operating_expenses
	end

	def cash_flow
		total_credit - total_debt
	end

end