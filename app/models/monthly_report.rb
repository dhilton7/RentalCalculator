class MonthlyReport < ActiveRecord::Base

	# Active Record relations
	belongs_to :deal
	has_many :financial_items
	
	accepts_nested_attributes_for :financial_items

	# Model functions

	# Total income for the month
	def total_income
		# TODO: rough syntax need to confirm
		financial_items.income.map(&:amount).reduce(:+) || 0
	end

	# Total expenses for the month
	def total_expenses
		# TODO: replicate income with expense scope
		financial_items.expense.map(&:amount).reduce(:+) || 0
	end

	# Total cashflow for the month
	def cash_flow
		total_income - total_expenses
	end
end
