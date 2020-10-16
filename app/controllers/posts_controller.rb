class PostsController < ApplicationController

def index
  @posts = Post.all
end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      # post_params,
      content: params[:content],
      category:params[:category],
      price:params[:price],
      limit:params[:limit],
      area:params[:area],
      # user_id: @current_user.id,
      image:"default.png",
    )

    if params[:image]
      @post.image = "#{@post.id}.png"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image}", image.read)
    end

    if
    @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]


    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")

    else
      render("posts/edit")
    end

  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  private
  #ストロングパラメーター
  def post_params
    params.require(:post).permit(:image)
    # params.require(:post).permit(:image,:category,:area,:content,:price,:limit,:remove_image)
  end

end
