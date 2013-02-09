class CafesController < ApplicationController

  def index
    @cafes = Cafe.all
    respond_to do |format|
      format.html
      format.json { render json: @cafes }
    end
  end

  def show
    @cafe = Cafe.where(:id => params[:id]).first
    respond_to do |format|
      format.html
      format.json { render json: @cafe }
    end
  end
end
