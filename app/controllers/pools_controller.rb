class PoolsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :find_pool, only: [:show, :edit, :update]

  def index
  #  @pools = Pool.all
  @pools = Pool.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@pools) do |pool, marker|
      marker.lat pool.latitude
      marker.lng pool.longitude
    end
  end

  def show
    @pool = Pool.find(params[:id])
    @pool_coordinates = {lat:@pool.latitude, lng:@pool.longitude}
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.create(pools_params)
    if @pool.save
      redirect_to # TODO = missing the User/show/routes
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pool.update(pools_params)
    redirect_to # TODO = missing the User/show/routes
  end

  private

  def find_pool
    @pool = Pool.find(params[:id])
  end


  def pools_params
    params.require(:pools).permit(
      :width,
      :height,
      :height,
      :depth,
      :color,
      :pool_house,
      :pool_toys,
      :pool_type,
      :water_type,
      :capacity,
      :description,
      :alcohol,
      :soft,
      :bbq,
      :pool_girl,
      :pool_boy,
      :address,
      photos: []
      )
  end
end









