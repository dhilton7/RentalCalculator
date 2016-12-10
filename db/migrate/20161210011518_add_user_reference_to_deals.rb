class AddUserReferenceToDeals < ActiveRecord::Migration
  def change
  	add_reference :deals, :user, index: true
  	add_column 		:deals, :notes, :text, null: true
  end
end
