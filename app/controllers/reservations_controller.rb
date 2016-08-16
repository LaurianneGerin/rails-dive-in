class ReservationsController < ApplicationController

  before_action :find_reservation, only: [:show, :edit, :update]

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
  end

  def edit
  end

  def update
    @reservation.update(reservation_params)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:begin_date, :end_date, :user_id, :pool_id, :statut)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
