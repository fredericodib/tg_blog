class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users
  def index
    @users = User.all

    render json: @users, except: [:token,:password_digest]
  end

  # GET /users/1
  def show
    render json: @user, except: [:token,:password_digest]
  end

  def user
    unless @current_user 
      render json: { errors: "Not Authenticated" }, status: :unauthorized
    else
      render json: @current_user, except: [:token,:password_digest]
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, except: [:password_digest], status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    unless @current_user 
      render json: { errors: "Not Authenticated" }, status: :unauthorized
    else
      if @current_user.update(user_params)
        render json: @current_user, except: [:token, :password_digest]
      else
        render json: @current_user.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /users/1
  def destroy
    unless @current_user 
      render json: { errors: "Not Authenticated" }, status: :unauthorized
    else
      @current_user.destroy
      render json: {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
