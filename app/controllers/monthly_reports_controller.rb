class MonthlyReportsController < ApplicationController

	before_action :set_report, only: [:show, :edit, :update, :destroy]
	before_action :set_property

	def new
		@report = @property.monthly_reports.new
	end

	def create
		@report = @property.monthly_reports.new monthly_report_params
		if @report.save
			redirect_to property_path(@property), notice: 'monthly report was created'
		else
			render :new
		end
	end

	def update
		if @report.update monthly_report_params 
			redirect_to property_path(@property), notice: 'monthly report was updated'
		else
			render :edit
		end
	end

	def destroy
		@report.destroy
		redirect_to property_path(@property), notice: 'report was deleted'
	end

	private

	def set_report
		@report = MonthlyReport.find params[:id]
	end

	def set_property
		@property = Property.find params[:property_id]
	end

	def monthly_report_params
		params.require(:monthly_report).permit(:month_year, income_items_attributes: [:id, :name, :amount, :_destroy], expense_items_attributes: [:id, :name, :amount, :_destroy])
	end

end
