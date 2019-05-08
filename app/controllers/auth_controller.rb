class AuthController < ApplicationController
  before_action :check_basic_auth

  def index
    render plain: "Got: #{@message}"
  end

  def check_basic_auth
    authenticated = authenticate_with_http_basic do |username, password|
      if username.present? && password.present?
        @message = "Username (#{username}) and password present"
        return true
      elsif username.present?
        @message = "Username (#{username}) present, no password"
        return true
      elsif password.present?
        @message = "Password present, no username"
        return true
      else
        @message = "No username or password present"
        return false
      end
    end
    @message = "No basic auth headers"
    return false
  end
end
