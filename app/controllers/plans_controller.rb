class PlansController < ApplicationController
  before_action :authenticate_user!

  def new
      @plan = Plan.new
  end

  def show
    # @user = User.find(params[:id])
    # gon.user= @user
    # sum_weigth = current_user.blogs.group("date(created_at)").sum(:weigth)
    
    # week_weight = @blogs.created_week
    # gon.data = []
    # gon.data = week_weight.map{ |weight| weight}
    # dates_weigth = current_user.posts.group("date(created_at)").select(:created_at)

    # gon.date = []
    # @dates = dates_weigthe.map{ |dates| dates.created_at}
    # # each文で日付の表記を1つずつ取り出して変える
    # @dates.each do |a|
    #   gon.date << a.strftime("%Y年%m月%d日")
    # end
    
    gon.weight = current_user.blogs.group("date(created_at)").select(:weight).map{ |weight| weight[:weight]}
    # @blogs = @user.blogs.all
    # # @blogs_fat = @user.blogs.all
    # @blog = Blog.new

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

  def show_blogs
    today = Date.current
    @labels = []
    @week_weight = @blogs.created_week
    # @onemonth_weigth = @blogs.created_1month
    # @threemonth_weigth = @blogs.created_3month
    # @oneyear_weigth = @blogs.created_1year

    # @week_fat = @blogs.created_week
    # @onemonth_fat = @blogs.created_1month
    # @threemonth_fat = @blogs.created_3month
    # @oneyear_fat = @blogs.created_1year

  end

  def plan_params
  	params.require(:plan).permit(:start_weight, :target_weight, :weigth)
  end
end