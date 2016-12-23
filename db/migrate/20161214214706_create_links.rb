class CreateLinks < ActiveRecord::Migration
	def change
    create_table :links do |t|
    	t.string :name, null: false
    	t.string :url, null: false
    	t.references :property, index: true
    	t.timestamps null: false
    end
  end
end
