class Entry < ActiveRecord::Base

	belongs_to :sheet
	belongs_to :entry_category
	belongs_to :property

	# Override getter / setter
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