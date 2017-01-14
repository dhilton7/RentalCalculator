class Entry < ActiveRecord::Base

	belongs_to :sheet
	belongs_to :category
	belongs_to :property

end