class CoordinatesController < ApplicationController
  before_action :correct_user, only: [:destroy]
   before_action :require_user_logged_in
   
  def show
    @coordinate = Coordinate.find(params[:id])
  end  
   
  def new
    @coordinate= Coordinate.new
  end

  def create
    @coordinate = current_user.coordinates.build(coordinate_params)
    if @coordinate.save
      flash[:success]='投稿完了'
      redirect_to root_url
    else
      flash.now[:danger] = '投稿失敗'
      render :new
    end  
  end
  def edit
    @coordinate = Coordinate.find(params[:id])
  end
  
  def update
    @coordinate = Coordinate.find(params[:id])
    
    if @coordinate.update(coordinate_params)
      flash[:success] = '更新成功'
      redirect_to root_url
    else
      flash.now[:danger] = '更新失敗'
      render :edit
    end  
  end
  
  def destroy
    @coordinate.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to root_url
  end

  private
  
  def coordinate_params
    params.require(:coordinate).permit(:content,:img)
  end  
  
  def correct_user
    @coordinate = current_user.coordinates.find_by(id: params[:id])
    unless @coordinate
      redirect_to root_url
      
    end 
  end   
end