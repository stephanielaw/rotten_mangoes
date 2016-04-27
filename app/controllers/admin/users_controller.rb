class Admin::UsersController < Admin::ApplicationController

  def index
    # Renders /views/admin/index.html.erb
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  protected
      def user_params
        params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
      end


end


