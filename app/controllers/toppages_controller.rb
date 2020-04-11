class ToppagesController < ApplicationController
  def index
    if logged_in?
       @coordinates = current_user.coordinates.order(id: :desc).page(params[:page])
    end
  end
end
