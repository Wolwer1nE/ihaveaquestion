class  BaseAuthController  < ApplicationController
  before_action :get_user

  private

  def get_user
    @current_user = User.find_by_id(session[:user])
    redirect_to auth_path unless @current_user.present?
  end
end