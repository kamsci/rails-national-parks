class ParksController < ApplicationController

  def index
    @parks = Park.all
  end

  def show
    @parks = Park.find(params[:id])
    # .includes(:rangers)
    # render json: params
  end

  def edit
    @park = Park.find(params[:id])
    @rangers = Ranger.all
  end

  def update
    Park.find(params[:id]).update(park_params)
    redirect_to park_path(params[:id])
  end

  def new
    @park = Park.new
    # Query to get rangers in db
    @rangers = Ranger.all
  end

  def create
    # render json: params
    Park.create(park_params)
    redirect_to parks_path
  end

  def destroy
    Park.find(params[:id]).destroy
    redirect_to parks_path
  end

  private
  def park_params
    params.require(:park).permit(:name, :description, :picture, :ranger_ids => [])
  end

end
