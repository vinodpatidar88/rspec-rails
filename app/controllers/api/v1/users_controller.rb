class Api::V1::UsersController < ApplicationController
   skip_before_action :authenticate_user!, only: [ :create ]

   def index
     users = User.active
     users_with_images = users.map do |user|
      user.as_json.merge(
        image_url: user.image.attached? ? url_for(user.image) : nil,
        video_url: user.video.attached? ? url_for(user.video) : nil
      )
     end
     render json: users_with_images, status: :ok
   rescue StandardError => error
       render json: { message: error.message }, status: :internal_server_error
   end

   def create
      data = ::Users::CreateSerialiser.new(set_user_params(params)).call
      render json: data, status: :created
    rescue StandardError => e
      render json: { message: e.message }, status: :unprocessable_entity
   end

   def update
      user = User.find(params[:id])
      if user.blank?
        render json: { message: "redord not found" }, status: :not_found
      end
      user.update!(update_params)
      # render json: {message: 'Update Successfully'}, status: :no_content
      head :no_content
    rescue StandardError => e
      render json: { message: e.message }, status: :unprocessable_entity
   end

   def update_status
        user = User.find(params[:id])
        if user.blank?
          render json: { message: "record not found" }, status: :not_found
        end
        user.update!(update_status_params)
        render json: { message: "Status Update Successfully" }, status: :no_content
      rescue StandardError => e
        render json: { message: e.message }, status: :unprocessable_entity
   end

   def edit
      user = User.find(params[:id])
      render json: user, status: :ok
    rescue StandardError => e
      render json: { message: e.message }, status: :unprocessable_entity
   end

   def show
      render json: User.find(params[:id]), status: :ok
    rescue StandardError => e
       render json: { message: e.message }, status: :not_found
   end

   def delete
     rescue StandardError => e
       render json: { message: e.message }, status: :no_content
   end

   private
   def set_user_params(params)
     params.permit(:name, :email, :mobile_number, :status, :password_confirmation, :password, :image, :video)
   end

   def update_params
    params.permit(:id, :name, :email, :status, :mobile_number, :password_confirmation, :password, :image, :video)
   end

   def update_status_params
    params.permit(:id, :status)
   end
end
