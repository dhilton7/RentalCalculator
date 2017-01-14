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

	# return true if property is active investment
	def active?
		status == STATUSES[2]
	end

	def to_s
		"#{address} #{city}, #{state} #{zip}"
	end

end
