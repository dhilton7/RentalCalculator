class SheetsController < ApplicationController

	before_action :set_sheet, only: [:show, :update, :destroy]

	def new
		@sheet = Sheet.new
	end

	def create
		@sheet = current_user.sheets.new sheet_params
		if @sheet.save
			redirect_to sheet_path(@sheet), notice: 'sheet saved.'
		else
			render :new, error: 'Could not save sheet.'
		end
	end

	def update
		if @sheet.update sheet_params
			redirect_to sheet_path(@sheet), notice: 'sheet updated.'
		else
			render :edit
		end
	end

	def destroy
		@sheet.destroy
		redirect_to sheets_path, notice: "sheet deleted successfully."
	end

	private

	def sheet_params
		params.require(:sheet).permit(:title)
	end

	def set_sheet
		@sheet = Entry.find params[:id]
	end

end