require "json_web_token"

class Api::V1::AuthenticationsController < ApplicationController
   skip_before_action :authenticate_user!, only: [:login]

   def login
      user = User.find_by(email: login_params[:email])
      unless user&.authenticate(login_params[:password])
        render json: {error: "credentails invalid"}, status: :unauthorized
        return false
      end

      token = JsonWebToken.encode(user_id: user.id)
      render json: { user: user, token: token }, status: :ok
   rescue => e
    Rails.logger.info("some thing went wrong for autherizations")
    render json: { errors: e.full_message }, status: :unauthorized
   end

   def logout
   end

   private

   def login_params
     params.require(:authentication).permit(:email, :password)
   end
end
