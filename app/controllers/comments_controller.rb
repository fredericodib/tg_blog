class CommentsController < ApplicationController

  # GET /comments
  def index
    @comments = Post.find(params[:post_id]).comments

    render json: @comments, include: {user: {except:[:token,:password_digest]}}
  end

  # POST /comments
  def create
    unless @current_user 
      render json: { errors: "Not Authenticated" }, status: :unauthorized
    else
      @comment = Comment.new(comment_params)
      @comment.user = @current_user
      @comment.post = Post.find(params[:post_id])

      if @comment.save
        render json: @comment, status: :created, include: {user: {except:[:token,:password_digest]}}
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /comments/1
  def destroy
    unless @current_user 
      render json: { errors: "Not Authenticated" }, status: :unauthorized
    else
      @comment = Post.find(params[:post_id]).comments.find(params[:comment_id])
      if @comment.user != @current_user
        render json: { errors: "Dont have Permission" }, status: :unauthorized
      else
        @comment.destroy
        render json: {}
      end
    end
    
  end

  private
    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:message)
    end
end
