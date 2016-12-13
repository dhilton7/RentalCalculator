class MonthlyReportsController < ApplicationController

	before_action :set_report, only: [:edit, :update, :destroy]
	before_action :set_deal

	def new
		@report = @deal.monthly_reports.new
	end

	def create
		@report = @deal.monthly_reports.new monthly_report_params
		if @report.save
			redirect_to deal_path(@deal)
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def destroy
		@report.destroy
		redirect_to deal_path(@deal), notice: 'report was deleted'
	end

	private

	def set_report
		@report = MonthlyReport.find params[:id]
	end

	def set_deal
		@deal = Deal.find params[:deal_id]
	end

	def monthly_report_params
		params.require(:monthly_report).permit(:month_year, income_items_attributes: [:id, :name, :amount, :_destroy], expense_items_attributes: [:id, :name, :amount, :_destroy])
	end

end
