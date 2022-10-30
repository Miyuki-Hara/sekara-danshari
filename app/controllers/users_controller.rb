class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @items = current_user.items
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to _user_path(user_params)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :password, :encrypted_password, :profie).merge(user_id: current_user.id)
  end
end
