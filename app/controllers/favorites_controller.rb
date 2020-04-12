class FavoritesController < ApplicationController
  def create
    coordinate = Coordinate.find(params[:coordinate_id])
    current_user.fav(coordinate)
    flash[:success] = "お気に入りに追加しました"
    redirect_to root_url
    
  end

  def destroy
    coordinate = Coordinate.find(params[:coordinate_id])
    current_user.unfav(coordinate)
    flash[:success]='お気に入りから外しました'
    redirect_to root_url
  end
end
