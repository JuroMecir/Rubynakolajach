class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update ]

  def show
    @user = User.find(params[:id])
    @catches = @user.catches.all.paginate(page: params[:page]).order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def index
    @users = User.search(params[:search]).paginate(page: params[:page]).order('id DESC')
  end

  def current_user?(user)
    user == current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Účet úspešne vytvorený"
      redirect_to urcatches_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profil upravený"
      redirect_to home_url
    else
      render 'edit'
    end
  end

  def destroy
    ActiveRecord::Base.connection.execute(
        "BEGIN;
        DELETE FROM catches WHERE catches.user_id = '#{current_user.id}';
        DELETE FROM users WHERE users.id = '#{current_user.id}';
        COMMIT;"
    )
    redirect_to home_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :surname, :age)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Prosím prihláste sa."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end


end

