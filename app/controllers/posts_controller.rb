class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts_count = Post.count
  end

  def new
    @post  = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "予定を作成しました"
      redirect_to posts_path
    else
      flash.now[:alert] = "予定の作成に失敗しました"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "予定を更新しました"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "予定の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :start_date, :end_date, :all_day, :updated_time, :memo)
  end
end
