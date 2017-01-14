class CreateEntryCategories < ActiveRecord::Migration
  def change
    create_table :entry_categories do |t|
    	t.string :name, null: false
      t.timestamps null: false
    end

    [	"Rents Received", 
    	"Fees", 
    	"CapEx Deductible (DMSH)", 
    	"Advertising", 
    	"Auto and Travel", 
    	"Cleaning and Maintenance", 
    	"Commissions", 
    	"Insurance", 
    	"Legal and Professional Fees", 
    	"Management Fees", 
    	"Mortgage Principal", 
    	"Other Interests", 
    	"Repairs",
    	"Supplies",
    	"Taxes",
    	"Utilities",
    	"Meals and Entertainment",
    	"Other Expenses"
    ].each do |item|
  	 EntryCategory.create(name: item)
    end
  end
end
