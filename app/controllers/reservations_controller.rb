class ReservationsController < ApplicationController

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
    reservation = Reservation.new(reservation_params)
    if reservation.save
      redirect_to #TODO = user#show
    else
      render :new
  end

  def edit
  end

  def update
    @reservation.update(reservation_params)
  end

  def destroy
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:begin_date, :end_date, :user_id, :pool_id, :statut)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
