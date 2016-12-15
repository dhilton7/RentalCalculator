class LinksController < ApplicationController

	before_action :set_deal
	before_action :set_link, only: [:edit, :update, :destroy]

	def new
		@link = @deal.links.new
	end

	def create
		link = @deal.links.new link_params
		if link.save
			redirect_to deal_path(@deal), notice: "New link created"
		else
			render :new, notice: 'Link could not be created'
		end
	end

	def edit
	end

	def update
		if @link.update link_params
			redirect_to deal_path(@deal), notice: "Link updated"
		else
			render :edit
		end
	end

	def destroy
		@link.destroy
		redirect_to deal_path(@deal)
	end

	private

	def link_params
		params.require(:link).permit(:name, :url)
	end

	def set_deal
		@deal = Deal.find params[:deal_id]
	end

	def set_link
		@link = Link.find params[:id]
	end
end