class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :date_of_birth, :avatar)
    end
end

