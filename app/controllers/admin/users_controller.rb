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

      if current_user&.super_admin?
        apply_admin_flags(@user)
      end

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
        if current_user&.super_admin?
          apply_admin_flags(@user)
          @user.save if @user.changed?
        end

        redirect_to admin_user_path(@user), notice: "User updated."
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
        :password,
        :password_confirmation,
        :name,
        :avatar
      )
    end

    def apply_admin_flags(user)
      bool = ActiveModel::Type::Boolean.new

      if params[:user].key?(:admin) || params[:user].key?("admin")
        user.admin = bool.cast(params.dig(:user, :admin))
      end

      if params[:user].key?(:super_admin) || params[:user].key?("super_admin")
        user.super_admin = bool.cast(params.dig(:user, :super_admin))
      end
    end
  end
end
