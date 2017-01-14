class Finances < ActiveRecord::Migration
  def change
  	create_table :sheets do |t|
  		t.string :title, null: false
  		t.references :user, index: true
  		t.timestamps null: false
  	end

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
end
