class Finances < ActiveRecord::Migration
  def change
  	create_table :sheets do |t|
  		t.string :title, null: false
  		t.references :user, index: true
  		t.timestamps null: false
  	end

    create_table :entry_categories do |t|
      t.string :name, null: false
      t.boolean :debt, null: true
      t.boolean :operating, null: true
      t.timestamps null: false
    end
    create_entry_categories

  	create_table :entries do |t|
  		t.integer :amount, null: false 						# stored as cents
  		t.string :account, null: false
  		t.string :description, null: true
  		t.date :date
  		t.references :property, index: true
  		t.references :entry_category, index: true
  		t.references :sheet, index: true
  		t.timestamps null: false
  	end
  end

  def create_entry_categories
    [ {name: "Rents Received", debt: false, operating: true},
      {name: "Fees", debt: false, operating: true},
      {name: "CapEx Deductible (DMSH)", debt: true, operating: true},
      {name: "Advertising", debt: true, operating: true},
      {name: "Auto and Travel", debt: true, operating: true},
      {name: "Cleaning and Maintenance", debt: true, operating: true},
      {name: "Commissions", debt: true, operating: true},
      {name: "Insurance", debt: true, operating: true},
      {name: "Legal and Professional Fees", debt: true, operating: true},
      {name: "Management Fees", debt: true, operating: true},
      {name: "Mortgage Principal", debt: true, operating: false},
      {name: "Other Interests", debt: true, operating: false},
      {name: "Repairs", debt: true, operating: true},
      {name: "Supplies", debt: true, operating: true},
      {name: "Taxes", debt: true, operating: false},
      {name: "Utilities", debt: true, operating: true},
      {name: "Meals and Entertainment", debt: true, operating: true},
      {name: "Other Expenses", debt: true}
    ].each do |item|
     EntryCategory.create(item)
    end
  end
end
