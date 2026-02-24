class Api::V1::UsersController < ApplicationController
   def index
    begin
     users = User.active
     render json: users, status: :ok
    rescue StandardError => error
       render json: {message: error.message}, status: :bad_request
    end
   end

   def create
    begin
      data = ::Users::CreateSerialiser.new(set_user_params(params)).call
      render json: data, status: :ok
    rescue StandardError => e
      render json: {errors: e.message}, status: :bad_request
    end
   end

   private 
   def set_user_params(params)
     params.require(:user).permit(:name, :email, :mobile_number, :status)
   end
end