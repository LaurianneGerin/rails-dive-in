class ReservationsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new]
  before_action :find_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def show
    #TODO = doit etre integrer au niveau du User#show
  end

  def new
    @reservation = Reservation.new
    #TODO = doit etre integrer dans pool#show, puis supprimer ici.
  end

  def create
    reservation = Reservation.new
    reservation.begin_date = Date.strptime(session[:begin_date], "%m/%d/%Y")
    reservation.end_date = Date.strptime(session[:end_date], "%m/%d/%Y")
    reservation.user = current_user
    reservation.pool = Pool.find(params[:pool_id])
    if reservation.save
      redirect_to #TODO = user#show
    else
      render :new
    end
  end

  def edit
  end

  def update
    @reservation.update(reservation_params)
    redirect_to root_path
    # TODO afficher le message de confirmation de reservation.
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:begin_date, :end_date, :user_id, :pool_id, :statut)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
