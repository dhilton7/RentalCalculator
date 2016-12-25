class Property < ActiveRecord::Base

	# Active Record Relations
	has_many :monthly_reports, dependent: :destroy
	has_many :links, dependent: :destroy
	has_one :deal, dependent: :destroy
	belongs_to :user

	# Validations
	validates :address, :city, :state, :zip, presence: true

	# Pagination Count
	self.per_page = 10

	# Constants
	STATUSES = ['prospect', 'closing', 'active', 'sold']

	# Scopes
	scope :active, -> { where(status: STATUSES[2])}

	# return full address string
	def address_string
		"#{address} #{city}, #{state} #{zip}"
	end

	# return true if property is active investment
	def active?
		status == STATUSES[2]
	end

	# return total cash flow
	def actual_cash_flow
		total_income - total_expenses
	end

	def total_expenses
		monthly_reports.map(&:total_expenses).reduce(:+) || 0
	end

	def total_income
		monthly_reports.map(&:total_income).reduce(:+) || 0
	end

end
