require 'securerandom'
class AuthController < ApplicationController

  def index

  end

  def set_development_user
    user = User.first
    session['user'] = user.id
    redirect_to '/'
  end

  def new
    return set_development_user if Rails.env == 'development'

    redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV['GITHUB_ID']}"+
                              "&scope=read:user&state=#{SecureRandom.hex}"
  end

  def github
    user_data = get_user_data
    user = User.find_by_login user_data[:login]
    if user.nil?
     user = User.create(login: user_data[:login], avatar_url: user_data[:avatar_url])
    end
    session['user'] = user.id
    redirect_to '/'
  end

  private

  def get_user_data
   request_params = {client_id: ENV['GITHUB_ID'],
                      client_secret: ENV['GITHUB_SECRET'],
                      code: params[:code],
                      state: params[:state]}
    response = RestClient.post 'https://github.com/login/oauth/access_token', request_params
    data = response.body.split('&').map {|x| x.split('=')}.to_h
    user_response = RestClient.get 'https://api.github.com/user', {Authorization: "token #{data['access_token']}"}
    JSON.parse(user_response.body).symbolize_keys
  end

end