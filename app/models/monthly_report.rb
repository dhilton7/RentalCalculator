class MonthlyReport < ActiveRecord::Base

	# Active Record relations
	belongs_to :property
	has_many :income_items, dependent: :destroy
	has_many :expense_items, dependent: :destroy
	
	accepts_nested_attributes_for :income_items
	accepts_nested_attributes_for :expense_items

	# Validations
	validates :month_year, presence: true

	# Model functions

	# Total income for the month
	def total_income
		income_items.map(&:amount).reduce(:+) || 0
	end

	# Total expenses for the month
	def total_expenses
		expense_items.map(&:amount).reduce(:+) || 0
	end

	# Total cashflow for the month
	def cash_flow
		total_income - total_expenses
	end

end
