class PropertiesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_property, only: [:show, :edit, :update, :destroy, :activate]

	def new
		@property = Property.new
	end

	def create
		@property = current_user.properties.new property_params
		if @property.save
			redirect_to property_path(@property), notice: "Property was created."
		else
			render :new
		end
	end

	def show
	end

	def index
		@q = current_user.properties.ransack(params[:q])
		@properties = @q.result(distinct: true).paginate(page: params[:page])
	end

	def edit
	end

	def update
		if @property.update property_params
			redirect_to property_path(@property), notice: "Property was updated."
		else
			render :edit
		end
	end

	def destroy
		@property.destroy
		redirect_to properties_path, notice: "Property was successfully deleted."
	end

	def activate
		@property.update_attribute(:status, Property::STATUSES[2])
		redirect_to property_path(@property), notice: "Property is now active."
	end

	def active
		@properties = current_user.properties.active.paginate(page: params[:page])
	end

	private

	def set_property
		@property = Property.find params[:id]
	end

	def property_params
		params.require(:property).permit(:address, :city, :state, :zip, :notes)
	end
end