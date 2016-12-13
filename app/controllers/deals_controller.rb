class DealsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_deal, only: [:show, :edit, :update, :destroy, :activate]

	def new
		@deal = Deal.new
	end

	def create
		@deal = Deal.new deal_params
		if @deal.save
			redirect_to deal_path(@deal)
		else
			render :new
		end
	end

	def show
	end

	def index
		@deals = current_user.deals.order('created_at desc')
	end

	def edit
	end

	def update
		if @deal.update deal_params
			redirect_to deal_path(@deal)
		else
			render :edit
		end
	end

	def destroy
		@deal.destroy
		redirect_to deals_path, notice: "Deal was successfully deleted."
	end

	def activate
		@deal.update_attribute(:status, Deal::STATUSES[2])
		redirect_to deal_path(@deal), notice: "Deal was updated to active"
	end

	private

	def set_deal
		@deal = Deal.find params[:id]
	end

	def deal_params
		params.require(:deal).permit(:address, :city, :state, :zip, :neighborhood_scout, :purchase_price, :list_price, :arv, :closing_costs, :estimated_repairs, :down_payment, :interest_rate, :loan_points, :loan_years, :gross_rent, :other_income, :electricity, :water_sewer, :pmi, :insurance, :property_tax, :other_expenses, :vacancy, :repairs_maintenance, :cap_ex, :property_management, :notes)
	end
end
