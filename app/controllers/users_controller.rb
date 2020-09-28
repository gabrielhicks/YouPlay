class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :login, :handle_login]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
      @user = User.new
  end

  def show
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
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
        session[:user] = @user.id
        redirect_to videos_path
    else
        flash[:message] = "Incorrect Username or Password"
        redirect_to login_path
    end
  end


  def logout
    session[:user] = nil
    redirect_to login_path
  end


    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

    def find_user
      @user = User.find_by(id: params[:id])
    end
end
