require "json_web_token"

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
  before_action :authenticate_user!

  def authenticate_user!
    token = request.headers["Authorization"]

    if token.blank?
      render json: { error: "Unauthorized" }, status: :unauthorized
      return false
    end

    decoded = JsonWebToken.decode(token)
    @current_user = User.find(decoded[:user_id])
  rescue
    render json: { error: "Unauthorized" }, status: :unauthorized
  end
end
