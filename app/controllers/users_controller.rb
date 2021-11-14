class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = User.find(current_user.id)
    if @user != current_user
       redirect_to user_path(current_user.id)
    end
  end

  def update
     @user = current_user
     @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = '更新しました。続いて、目標を立てましょう!'
      redirect_to new_plan_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :age, :height)
  end
end
