class CommentsController < ApplicationController

def create
  @post = Post.find_by(id: params[:id])
  @comment = Comment.new(
    user_id: @current_user.id,
    post_id: params[:post_id],
    comment: params[:comment]
  )
  @comment.save
  redirect_to("/posts/#{params[:post_id]}")
end

def destroy
  @post = Post.find_by(id: params[:id])
  @comment = Comment.find_by(
    id:params[:id],
    user_id: @current_user.id,
    post_id: params[:post_id],
  )
 @comment.destroy
  redirect_to("/posts/#{params[:post_id]}")

end


end
