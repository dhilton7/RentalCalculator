class DealsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_property
	before_action :set_deal, only: [:edit, :update, :destroy]

	def new
		@deal = Deal.new
		@deal.loans.build
	end

	def create
		@deal = @property.build_deal deal_params
		if @deal.save
			redirect_to property_path(@property), notice: "Analysis was created."
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @deal.update deal_params
			redirect_to property_path(@property), notice: "Analysis was updated."
		else
			render :edit
		end
	end

	def destroy
		@deal.destroy
		redirect_to properties_path, notice: "Analysis was successfully deleted."
	end

	private

	def set_deal
		@deal = Deal.find params[:id]
	end

	def set_property
		@property = Property.find params[:property_id]
	end

	def deal_params
		params.require(:deal).permit(:purchase_price, :list_price, :arv, :closing_costs, :estimated_repairs, :gross_rent, :other_income, :electricity, :water_sewer, :pmi, :insurance, :property_tax, :other_expenses, :vacancy, :repairs_maintenance, :cap_ex, :property_management, :cash_purchase, loans_attributes: [:id, :amount, :down_payment, :points, :fees, :ammortization, :interest_rate, :interest_only, :_destroy])
	end
end
