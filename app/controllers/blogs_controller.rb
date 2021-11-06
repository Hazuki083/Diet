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

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    Blog.create(blog_params)
    redirect_to blogs_path
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to blogs_path, notice: "編集しました"
    # else
    #   render 'edit'
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end


private

 def blog_params
   params.require(:blog).permit(:weight, :body_fat, :memo, :image, :day)
 end
end
