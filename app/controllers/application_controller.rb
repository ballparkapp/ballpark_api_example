class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from OAuth2::Error do |exception|
    if exception.response.status == 401
      session[:access_token] = nil
      redirect_to root_url, alert: "Access token expired, try signing in again."
    end
  end


  private

  def oauth_client
    @oauth_client ||= OAuth2::Client.new(ENV["BALLPARK_APPID"], ENV["BALLPARK_SECRET"], site: "http://#{session[:subdomain]}.ballparkapp.com")
  end

  def access_token
    if session[:access_token]
      @access_token ||= OAuth2::AccessToken.new(oauth_client, session[:access_token])
    end
  end
end
