module Admin
  class UsersController < Admin::BaseController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: "User created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: "User updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        redirect_to admin_users_path, notice: "User was deleted successfully."
      else
        redirect_to admin_users_path, alert: "Could not delete user."
      end
    end

    private

    def user_params
      params.require(:user).permit(
        :email,
        :admin,
        :password,
        :password_confirmation,
        :confirmed_at,
        :name,
        :avatar
      )
    end
  end
end
