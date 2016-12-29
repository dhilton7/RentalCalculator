class Link < ActiveRecord::Base

	# Active Record Relations
	belongs_to :property

	# Validations
	validates :name, :url, presence: true
	
end
