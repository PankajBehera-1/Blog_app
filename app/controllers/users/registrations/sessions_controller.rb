class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: %i[create destroy]

  def create
    user = User.find_for_database_authentication(email: params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      sign_in(user)
      render json: { user: user }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    sign_out(current_user)
    render json: { message: 'Logged out successfully' }
  end
end
