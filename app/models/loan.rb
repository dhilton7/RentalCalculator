class Loan < ActiveRecord::Base

	# Active Record Relations
	belongs_to :deal

	# Validations
	validates :amount, :down_payment, :ammortization, :fees, :interest_rate, presence: true

	# Model Functions

	# monthly payments with interest
	def monthly_payment
		c = monthly_interest
		if interest_only?
			c * amount
		else
			n = total_payments
			(amount * ((c * ((1 + c)**n)) / (((1 + c)**n) - 1))).round(2)
		end
	end

	# calculate monthly interest rate
	def monthly_interest
		interest_rate / (100 * 12)
	end

	# calculate number of monthly payments of loan
	def total_payments
		ammortization * 12
	end

	# calculate payment for points
	def points_payment
		(points || 0) * amount / 100
	end

end
