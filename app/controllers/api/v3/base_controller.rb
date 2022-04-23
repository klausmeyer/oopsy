module Api
  module V3
    class BaseController < ActionController::API
      rescue_from UnauthorizedError do
        head :unauthorized
      end
    end
  end
end
