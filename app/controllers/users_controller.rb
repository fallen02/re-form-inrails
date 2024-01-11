class UsersController < ApplicationController

  before_action :find_user, only: [:edit, :update]
  def new
    @user = User.new
  end

  def edit

  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update

    if @user.update(user_params)
      redirect_to new_user_path
    else
      render :edit , status: :unprocessable_entity
    end
  end

  private

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
