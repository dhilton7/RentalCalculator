class Deal < ActiveRecord::Base

	# Active Record relations

	has_many :monthly_reports
	belongs_to :user

	# Constants
	STATUSES = ['prospect', 'closing', 'active', 'sold']

	# Scopes
	scope :active, -> { where(status: STATUSES[2])}

	# Pagination Count
	self.per_page = 10

	# Model Functions

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

	# calculate operating expenses
	def operating_expenses
		electricity + water_sewer + pmi + insurance.round(2) + property_tax + other_expenses + vacancy_dollars + + cap_ex_dollars + repairs_dollars + property_management_dollars
	end

	# calculate mortgage expenses
	def mortgage_expenses
		mortgage_payment_monthly + pmi
	end	

	# calculate dollar value of vacancy from percent
	def vacancy_dollars
		(vacancy / 100.00) * total_income
	end

	# calculate dollar value of repairs and maintenance from percent
	def repairs_dollars
		(repairs_maintenance / 100.00) * total_income
	end

	# calculate dollar value of cap ex
	def cap_ex_dollars
		(cap_ex / 100.00) * total_income
	end

	# calculate dollar value of property management from percent
	def property_management_dollars
		(property_management / 100.00) * total_income
	end

	# calculate monthly cash flow
	def cash_flow
		total_income - total_expenses
	end

	# calculate net operating income
	def noi
		(total_income - operating_expenses) * 12
	end

	# total cash needed for deal
	def total_cash_needed
		down_payment + closing_costs + estimated_repairs + (loan_points * loan_amount)
	end

	# predicted cap rate based on ARV (Pro Forma Cap)
	def pro_forma_cap_rate
		(noi / arv * 100).round(2)
	end

	# calculate cap rate for purchase 
	def purchase_cap_rate
		(noi / purchase_price * 100).round(2)
	end

	# calculate cash on cash ROI
	def cash_on_cash_roi
		(cash_flow * 12 / total_cash_needed * 100).round(2)
	end

	# calculate Property Tax (P) & Insurance (i) per month
	def p_i
		insurance + property_tax
	end

	# return full address string
	def address_string
		"#{address} #{city}, #{state} #{zip}"
	end

end