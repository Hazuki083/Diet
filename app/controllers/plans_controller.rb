class PlansController < ApplicationController
  before_action :authenticate_user!

  def new
      @plan = Plan.new
  end

  def show
    if user_signed_in?
    @plan = Plan.find(params[:id])
    @user = User.find(params[:id])
    @blogs = @user.blogs.all
    gon.user = @user
    # dates_weight = current_user.blogs.group("date(created_at)").select(:created_at)
    gon.date = []
    # @dates = dates_weight.map { |dates| dates.created_at }
    # # each文で日付の表記を1つずつ取り出して変える
    # @dates.each do |day|
    #   gon.date << day.strftime("%m月%d日")
    # end
    @graphdays =  @user.blogs.order(created_at: "DESC").limit(6).reverse
        @dayline = Array.new
        @graphdays.each do |graphday|
            @dayline.push(graphday.created_at.strftime('%m/%d').to_s)
        end
    gon.weight = current_user.blogs.group("date(created_at)").select(:weight).map { |weight| weight[:weight] }
    gon.body_fat = current_user.blogs.group("date(created_at)").select(:body_fat).map { |body_fat| body_fat[:body_fat] }
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
     @user = User.find(current_user.id)
    if @user != current_user
       redirect_to user_path(current_user.id)
    end
  end
  
  def update
     @user = current_user
     @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = '更新しました。'
      redirect_to blogs_path(@user.id)
    else
      render :edit
    end
  end



  private

  def plan_params
  	params.require(:plan).permit(:start_weight, :target_weight, :weigth, :body_fat).merge(user_id: current_user.id)
  end
end