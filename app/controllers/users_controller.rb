class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :login, :handle_login]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def new
      @user = User.new
  end

  def show
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user] = @user.id
      flash[:success] = "You have successfully create an account for #{@user.name}! Yeah!"
      redirect_to user_path(@user)
    else
      flash[:login_error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated!"
      redirect_to @user
    else
      redirect_to user_path(@current_user)
    end
  end

  def delete
  end

  def destroy
  end

  def login
  end


  def handle_login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
        flash[:success] = "Welcome back, #{@user.name}!"
        session[:user] = @user.id
        redirect_to user_path(@user)
    else
        flash[:errors] = "Incorrect Username or Password"
        redirect_to login_path
    end
  end


  def logout
    session[:user] = nil
    redirect_to videos_path
  end


    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

    def find_user
      @user = User.find_by(id: params[:id])
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(user_path(@current_user)) unless current_user?(@user)
    end
end
