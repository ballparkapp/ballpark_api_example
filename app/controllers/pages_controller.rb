class PagesController < ApplicationController

  
  def index
    
  end

  def forward
    callback_url = ENV["BALLPARK_CALLBACK"]
    oauth_client.site = "https://#{params[:subdomain]}.ballparkapp.com"
    redirect_to oauth_client.auth_code.authorize_url(:redirect_uri => callback_url, :response_type => 'code')
  end

  def auth
    token_request = oauth_client.auth_code.get_token(params[:code], :redirect_uri => ENV["BALLPARK_CALLBACK"])
    session[:access_token] = token_request.token
    redirect_to ballpark_url
  end

  def ballpark
    resp = access_token.get('api/invoices').parsed if access_token
    @invoices = resp
  end

end
