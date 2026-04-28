class Rack::Attack
  throttle('req/ip', limit: 5, period: 1.minute) do |req|
    Rails.logger.warn("request ip address #{req.ip}")
    req.ip
  end

  throttle('login/ip', limit: 5, period: 20.seconds) do |req|
    if req.path == '/api/v1/login' && req.post?
      Rails.logger.warn("request ip address #{req.ip}")
      req.ip
    end
  end
end