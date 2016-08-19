class PoolsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :find_pool, only: [:show, :edit, :update]

  def index
    session[:city] = params[:search][:city]
    session[:capacity] = params[:search][:capacity]
    session[:begin_date] = params[:search][:start]
    session[:end_date] = params[:search][:end]

    if params[:search].nil?
      @pools = Pool.where.not(latitude: nil, longitude: nil)
    else
       @search = params[:search]
       @pools = Pool.near(@search[:city],10).where("capacity >= ?", @search[:capacity].to_f)
                    .select { |p| p.available?(@search[:start], @search[:end]) }
     end

      @hash = Gmaps4rails.build_markers(@pools) do |pool, marker|
        marker.lat pool.latitude
        marker.lng pool.longitude
      end
    end

  def show
    @pool = Pool.find(params[:id])
    @pool_coordinates = {lat:@pool.latitude, lng:@pool.longitude}

    @hash = Gmaps4rails.build_markers(@pool) do |pool, marker|
        marker.lat pool.latitude
        marker.lng pool.longitude
    end
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.create(pools_params)
    @pool.user_id = current_user.id
    if @pool.save
      redirect_to pool_path(@pool)
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
    params.require(:pool).permit(
      :name,
      :address,
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









