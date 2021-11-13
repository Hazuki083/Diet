class PlansController < ApplicationController
  before_action :authenticate_user!

  def new
      @plan = Plan.new
  end

  def show
    if user_signed_in?
    @user = User.find(params[:id])
    gon.user= @user

    # # each文で日付の表記を1つずつ取り出して変える
    # @dates.each do |a|
    #   gon.date << a.strftime("%Y年%m月%d日")
    # end


    gon.weight = current_user.blogs.group("date(created_at)").select(:weight).map { |weight| weight[:weight] }
    gon.body_fat = current_user.blogs.group("date(created_at)").select(:body_fat).map { |body_fat| body_fat[:body_fat] }
    # @blogs = @user.blogs.all
    # # @blogs_fat = @user.blogs.all
    # @blog = Blog.new
    end
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


  private

  def plan_params
  	params.require(:plan).permit(:start_weight, :target_weight, :weigth).merge(user_id: current_user.id)
  end
end