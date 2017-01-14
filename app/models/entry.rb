class Entry < ActiveRecord::Base

	belongs_to :sheet
	belongs_to :category
	belongs_to :property

	# Override getter / setter
	def amount=(val)
		super value.to_f * 100
	end

	def amount
		super.to_i / 100.00
	end

end