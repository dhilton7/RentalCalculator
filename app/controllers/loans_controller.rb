class LoansController < ApplicationController

	def edit
	end

	def update
	end

	def destroy

	end

	private

	def set_deal
		@deal = Deal.find params[:deal_id]
	end

	def set_loan
		@loan = Loan.find params[:id]
	end

	def loan_params
		params.require(:loan).permit(:amount, :down_payment, :points, :ammortization, :interest_rate, :interest_only)
	end

end