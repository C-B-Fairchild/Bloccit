class CommentsController < ApplicationController
   respond_to :html, :js

  def create
    @post = Post.find( params[:post_id])
    @comment = current_user.comments.new( comment_params )
    @comment.post = @post
    @new_comment = Comment.new
    
    authorize @comment
    
    if @comment.save
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] } 
    end
  end

  def show
     @comments = Post.find(params[:post_id])
     @comment = @post.comments.new
  end

  def new
    @comment= Comment.new
      authorize @comment
  end
  


  def index
    @comments = Comment.all
  end

  private

  def comment_params
    params.require(:comment).permit(:comment) 
  end
end