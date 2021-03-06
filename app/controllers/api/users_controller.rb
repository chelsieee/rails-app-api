class Api::UsersController < ApplicationController
  before_action :user_exists, except: [:create]

  def index
    render json: User.all.map { |user| { :id => user.id, :username => user.username } }
  end

  def create
    user = User.create(user_params)
    if user.valid?
      render json: { message: "#{user.username} has been created" }, status: 201
    else
      render json: { message: 'Unable to create user!' }, status: 500
    end
  end

  def show
    puts params[:id]
    user = User.find(params[:id])
    p user
    render json: {
      username: user.username
    }
  end

  def update
    user = User.find(params[:id]).update(user_params)
    if user
      render json: { message: "user has been updated" }, status: 201
    else
      render json: { message: 'Unable to update user!' }, status: 500
    end
  end

  def destroy
    User.destroy(params[:id])
    render json: { message: 'User has been deleted!' }
  end

  def user_params
    params.permit(:username, :password)
  end

end
