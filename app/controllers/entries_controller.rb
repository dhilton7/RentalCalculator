class EntriesController < ApplicationController

	before_action :set_entry, only: [:show, :update, :destroy]
	before_action :set_sheet

	def new
		@entry = Entry.new
	end

	def create
		@entry = @sheet.entries.create entry_params
		if @entry.save
			redirect_to sheet_path(@sheet), notice: 'entry saved.'
		else
			render :new, error: 'Could not save entry.'
		end
	end

	def update
		if @entry.update entry_params
			redirect_to sheet_path(@sheet), notice: 'entry updated.'
		else
			render :edit
		end
	end

	def destroy
		@entry.destroy
		redirect_to sheets_path, notice: "Entry deleted successfully."
	end

	private

	def entry_params
		params.require(:entry).permit(:amount, :account, :description, :date, :property_id, :entry_category_id)
	end

	def set_entry
		@entry = Entry.find params[:id]
	end

	def set_sheet
		@sheet = Sheet.find params[:sheet_id]
	end

end