class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    begin
      users = User.all
      render json: users, status: :ok
    rescue StandardError => e
      render json: {message: e.message}, status: :not_found
    end
  end

  def show
    begin
      render json: @user, status: :ok
    rescue StandardError => e
      render json: {message: e.message}, status: :not_found
    end
  end

  def create
    begin
      user = User.new(user_params)
      user.save
      render json: user, status: 201
    rescue StandardError => e
      render json: { message: e.message }, status: 500
    end
  end

  def update
    begin
      @user.update_attributes(user_params)
      @user.save
      render json: @user, status: :ok
    rescue StandardError => e
      render json: { message: e.message }, status: :ok
    end
  end

  def destroy
    begin
      username = @user.username
      @user.destroy
      render json: { message: "user #{username} deleted!"}
    rescue StandardError => e  
      render json: { message: e.message }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
