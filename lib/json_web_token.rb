class JsonWebToken
  SECRET_KEY = Rails.application.credentials.jwt_secret || Rails.application.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i   # expiration time
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    decoded.with_indifferent_access
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end
end