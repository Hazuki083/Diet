class PlansController < ApplicationController
  before_action :authenticate_user!

  def new
        @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save
        flash[:notice] = '目標を設定しました！'
        redirect_to blogs_path
    else
      flash[:notice] = '目標が設定されていません。'
      redirect_to new_plan_path(current_user)
    end
  end

  def edit
  end

  def show
  end

  private

  def plan_params
  	params.require(:plan).permit(:plan, :start_weight, :target_weight)
  end
end
