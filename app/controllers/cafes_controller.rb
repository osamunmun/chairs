class CafesController < ApplicationController
  def index
    @cafes = Cafe.all
  end
end
