class Api::V1::UserProfilesController < ApplicationController
    def index
       begin
         user_profiles = UserProfile.where(status: "active")
         render json: user_profiles, status: :ok
       rescue StandardError => e
         render json: { error: e.message }, status: :internal_server_error
       end
    end

    private

    def profile_params
        params.premit(:user_name, :follower_count, :following_count, :status, :url, :website_url)
    end
end
