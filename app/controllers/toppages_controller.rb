class ToppagesController < ApplicationController
  def index
    if logged_in?
       @coordinates = current_user.feed_coordinates.order(id: :desc).page(params[:page])
    end
  end
end
