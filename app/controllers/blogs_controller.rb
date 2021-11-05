class BlogsController < ApplicationController
  def index
    @blog = Blog.new
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end
  
  def show
    @blog = Blog.find(params[:id])
  end

  def create
    Blog.create(blog_parameter)
    redirect_to blogs_path
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

private

 def blog_params
   params.requir(:blog).permit(:weight, :body_fat, :memo, :image_id)
 end
end
