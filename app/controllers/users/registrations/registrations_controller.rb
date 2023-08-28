# frozen_string_literal: true

class Users::Registrations::RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:user).permit(:username, :date_of_birth, :gender, :email, :password, :password_confirmation, :avatar)
    end
end
