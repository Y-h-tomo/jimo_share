class PostsController < ApplicationController

  def index
    @posts = Post.all

  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @comments  = Comment.where(post_id: @post.id)
  end

  def create
    @post = Post.new(
      # **post_params,
      content: params[:content],
      category:params[:category],
      price:params[:price],
      limit:params[:limit],
      area:params[:area],
      user_id: @current_user.id,
      image:params[:image],
    )

    @post.save
    if  params[:image]
      @post.image = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image}", image.read)
    end

    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end



  def edit
    # @posts = Post.all
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.category = params[:category]
    @post.limit = params[:limit]
    @post.area = params[:area]
    @post.price = params[:price]

    if params[:image]
      @post.image = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image}", image.read)
    end

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

# コメント機能
 def comments
  @post = Post.find_by(id: params[:id])
  @comment = Comment.where(post_id: @post.id)
 end

# 検索機能

def search
  if params[:search].present?
    @posts = Post.where('category LIKE ?', "%#{params[:search]}%")
    redirect_to("/posts/search")
  else
    @post  = Post.none
  end

end

  private
  #ストロングパラメーター
  def post_params
    # params.rquiree(:post).permit(:image,:category,:area,:content,:price,:limit,)
    params.permit(:id, :image, :category, :area, :content, :price, :limit,:user_id)
  end

end
