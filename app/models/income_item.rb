class IncomeItem < ActiveRecord::Base

	# Active Record relations
	belongs_to :monthly_report

	# Validations
	validates :name, :amount, presence: true

end
