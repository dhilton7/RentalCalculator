class Deal < ActiveRecord::Base

	# calculate the monthly P&I
	def mortgage_payment_monthly
		c = monthly_interest_rate
		n = number_of_payments
		(loan_amount * ((c * ((1 + c)**n)) / (((1 + c)**n) - 1))).round(2)
	end

	# calculate interest rate per month
	def monthly_interest_rate
		interest_rate / (100 * 12)
	end

	# calculate number of monthly payments
	def number_of_payments
		loan_years * 12
	end

	# total loan amount
	def loan_amount
		purchase_price - down_payment
	end

	# calculate monthly income
	def total_income
		gross_rent + other_income
	end

	# calculate monthly expenses
	def total_expenses
		operating_expenses + mortgage_payment_monthly
	end

	def operating_expenses
		electricity + water_sewer + pmi + insurance.round(2) + property_tax + other_expenses + vacancy_dollars + repairs_dollars + property_management_dollars
	end

	# calculate dollar value of vacancy from percent
	def vacancy_dollars
		(vacancy / 100.00) * total_income
	end

	# calculate dollar value of repairs and maintenance from percent
	def repairs_dollars
		(repairs_maintenance / 100.00) * total_income
	end

	# calculate dollar value of property management from percent
	def property_management_dollars
		(property_management / 100.00) * total_income
	end

	# calculate monthly cash flow
	def cash_flow
		monthly_income - monthly_expenses
	end

	# calculate net operating income
	def noi
		(total_income - operating_expenses) * 12
	end

	# total cash needed for deal
	def total_cash_needed
		purchase_price + closing_costs + estimated_repairs + (points * loan_amount)
	end

	# predicted cap rate based on ARV
	def cap_rate
		noi / arv
	end

end