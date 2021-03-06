class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
    
  end

  def show
    @user = User.find(params[:id])
    if logged_in?
      @coordinates = @user.coordinates.order(id: :desc).page(params[:page])
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザ登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ登録失敗しました'
      render :new
    end
  end  
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes.page(params[:page])
  end  
    
end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end