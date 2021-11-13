class BlogsController < ApplicationController
  before_action :authenticate_user!


  def index
   if @user != current_user
    # @user = current_user
    @blog = Blog.new
    @blogs = Blog.all
   end
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
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
