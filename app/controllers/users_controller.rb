class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit]


  def edit
    @user = User.find(current_user.id)
  end

  # def create
  #   @user = User.new
  #   @user.user_id = current_user.id
  #   if @user.save
  #     flash[:notice] = '登録しました。続いて、目標を立てましょう!'
  #     redirect_to plans_new_path
  #   end
  # end

  def update
     @user = current_user
    if @user.update(user_params)
      flash[:notice] = '更新しました。続いて、目標を立てましょう!'
      redirect_to new_plan_path
    else
      render :edit
    end
    
    
    # @user = User.find(params[:id])


	   # if @user.update(user_params)
	   #  flash[:notice] = '登録しました。続いて、目標を立てましょう!'
    #     redirect_to plan_new_path
	   # else
	   #   render "edit"
	   # end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:sex, :age, :height)
  end

end
