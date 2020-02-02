class BlogsController < ApplicationController
before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end


  def edit
  end

  def update

    if @blog.update(blog_params)
        redirect_to blogs_path, notice: "whisperを編集しました！"
    else
        render :edit
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "whisperを作成しました！"
      else
        render 'new'
      end
    end
  end

  def show
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"whisperを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
