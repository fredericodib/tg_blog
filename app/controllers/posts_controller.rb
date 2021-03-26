class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts, include: {user: {except:[:token,:password_digest]}}
  end

  # GET /posts/1
  def show
    render json: @post, include: :user, include: {user: {except:[:token,:password_digest]}}
  end

  # POST /posts
  def create
    unless @current_user 
      render json: { errors: "Not Authenticated" }, status: :unauthorized
    else
      @post = Post.new(post_params)
      @post.user = @current_user

      if @post.save
        render json: @post, status: :created, location: @post, include: {user: {except:[:token,:password_digest]}}
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    unless @current_user 
      render json: { errors: "Not Authenticated" }, status: :unauthorized
    else
      if @post.user != @current_user
        render json: { errors: "Dont have Permission" }, status: :unauthorized
      else
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /posts/1
  def destroy
    unless @current_user
      render json: { errors: "Not Authenticated" }, status: :unauthorized
    else
      if @post.user != @current_user
        render json: { errors: "Dont have Permission" }, status: :unauthorized
      else
        @post.destroy
        render json: {}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
