class LinksController < ApplicationController

	before_action :set_property
	before_action :set_link, only: [:edit, :update, :destroy]

	def new
		@link = @property.links.new
	end

	def create
		@link = @property.links.new link_params
		if @link.save
			redirect_to property_path(@property), notice: "New link created"
		else
			render :new, notice: 'Link could not be created'
		end
	end

	def edit
	end

	def update
		if @link.update link_params
			redirect_to property_path(@property), notice: "Link updated"
		else
			render :edit
		end
	end

	def destroy
		@link.destroy
		redirect_to property_path(@property)
	end

	private

	def link_params
		params.require(:link).permit(:name, :url)
	end

	def set_property
		@property = Property.find params[:property_id]
	end

	def set_link
		@link = Link.find params[:id]
	end
end