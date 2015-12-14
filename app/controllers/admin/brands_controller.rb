class Admin::BrandsController < ApplicationController
	layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @brands = Brand.all
  end


  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save!
      redirect_to admin_brands_path
    else
      render :new
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to :back
  end

  private

  def brand_params
    params.require(:brand).permit(:brand_name, :brand_image)
  end
end
