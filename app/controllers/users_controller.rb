class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      render :new
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    if @users.update_attributes(user_params)
      redirect_to admin_users_path(@users)
    else
      render :edit
    end
  end

  protected

    def user_params
      params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
    end

end