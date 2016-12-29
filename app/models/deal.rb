class Deal < ActiveRecord::Base

	# Active Record relations
	has_many :loans, dependent: :destroy
	belongs_to :property

	accepts_nested_attributes_for :loans

	# Validations
	validates :purchase_price, :list_price, :arv, :closing_costs, :estimated_repairs, :gross_rent, :other_income, :electricity, :water_sewer, :pmi, :insurance, :property_tax, :other_expenses, :vacancy, :repairs_maintenance, :cap_ex, :property_management, :cash_purchase, presence: true

	# Model Functions
	
	# calculate monthly income
	def total_income
		gross_rent + other_income
	end

	# calculate monthly expenses
	def total_expenses
		operating_expenses + (cash_purchase? ? 0 : loans.map(&:monthly_payment).reduce(:+))
	end

	# calculate operating expenses
	def operating_expenses
		electricity + water_sewer + pmi + insurance.round(2) + property_tax + other_expenses + vacancy_dollars + + cap_ex_dollars + repairs_dollars + property_management_dollars
	end

	# calculate mortgage expenses
	def mortgage_expenses
		cash_purchase? ? 0 : (loans.map(&:monthly_payment).reduce(:+) + pmi)
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
		(cash_purchase? ? purchase_price : loans.map(&:down_payment).reduce(:+)) + closing_costs + estimated_repairs + loans.map(&:points_payment).reduce(:+)
	end

	# total project cost
	def total_project_cost
		purchase_price + closing_costs + estimated_repairs
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

end