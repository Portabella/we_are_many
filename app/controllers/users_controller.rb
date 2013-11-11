class UsersController < ApplicationController
  respond_to :html, :json

  def start
  end

  def index
    @users = User.find(:all, include: :user_interests)
    #respond_with @users #, except: [:created_at, :updated_at] 
    render json: @users.to_json(include: [:user_interests, :interests, :user_networks, :networks])
  end

  def edit
    @user = User.find(params[:id])
    respond_with @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:geekette])
    respond_with @user
  end

  def show
    # show_id = rand(1..User.all.count) unless params[:id]

    @user = User.includes(:user_interests).find(params[:id])
    respond_with @user, except: [:created_at, :updated_at]
  end

  def import
    @user = User.new(params[:data])
    @user.save
    redirect_to geekettes_path
  end
end