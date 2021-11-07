class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def create
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = '更新しました。続いて、目標を立てましょう!'
      redirect_to new_plan_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:sex, :age, :height)
  end

end
