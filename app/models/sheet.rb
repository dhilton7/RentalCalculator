class Sheet < ActiveRecord::Base

	# ACTIVE RECORD RELATIONS

	belongs_to :user
	has_many :entries


end