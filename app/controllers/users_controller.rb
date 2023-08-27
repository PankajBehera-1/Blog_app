class UsersController < ApplicationController
    def post_params
        params.require(:user).permit(:email, :password, :password_confirmation, :avatar)
    end
end
