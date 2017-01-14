class Entry < ActiveRecord::Base

	#
	# SCOPE
	#
	scope :debt, -> { includes(:entry_category).where(entry_categories: {debt: true}).references(:entry_category) }
	scope :credit, -> { includes(:entry_category).where(entry_categories: {debt: false}).references(:entry_category) }
	scope :operating_expense, -> { debt.where(entry_categories: {operating: true}) }

	# 
	# ACTIVE RECORD RELATIONS
	#
	belongs_to :sheet
	belongs_to :entry_category
	belongs_to :property

	#
	# Override getter / setter
	#
	def amount=(val)
		super val.to_f * 100
	end

	def amount
		super.to_i / 100.00
	end

	def date=(val)
		super Date.strptime(val, "%m/%d/%Y")
	end

end