class BlogsController < ApplicationController
  before_action :authenticate_user!


  def index
   if user_signed_in?
    # @user = current_user
    @blog = Blog.new
    @blogs = Blog.all
    @user = current_user
    # グラフ表示のため必要
    @weight = Blog.where(user_id: current_user.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    gon.today_weight = @weight
    @body_fat = Blog.where(user_id: current_user.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    gon.today_body_fat = @body_fat
   end
  end


  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    # @blog.user_id = current_user.id
    @blog[:start_time] = Date.today.strftime("%Y-%m-%d")
    if @blog.save
        flash[:notice] = '投稿しました'
        redirect_to blogs_path
    else
      flash[:notice] = '入力が足りてません。'
      redirect_to  blogs_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
       redirect_to blogs_path, notice: "編集しました"
    else
       render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "削除しました"
  end


private

 def blog_params
   params.require(:blog).permit(:weight, :body_fat, :memo, :image, :start_time).merge(user_id: current_user.id)
 end
end
