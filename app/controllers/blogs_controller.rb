class BlogsController < ApplicationController
  before_action :authenticate_user!
  

  def index
    @user = current_user
    @blog = Blog.new
    @blogs = Blog.all
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
    # @blog = Blog.new(blog_params)
    # @blog.user_id = current_user.id
    # @blog.save
    #   redirect_to blog_path(@blog)
    #   flash[:notice] = "You have created book successfully."

    Blog.create(blog_params)
    # @blog = Blog.new(blog_params)
    redirect_to blogs_path
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
   params.require(:blog).permit(:weight, :body_fat, :memo, :image, :start_time)
 end
end
