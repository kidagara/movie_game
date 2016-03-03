class SessionsController < ApplicationController
  skip_before_filter :authenticate

  def new
  end

  # def create
  #   user = User.from_omniauth(request.env["omniauth.auth"])
  #   cookies[:auth_token] = user.auth_token
  #   redirect_to root_path, notice: "#{user.name} signed in with #{user.provider} successfully!"
  # end

  # def destroy
  #   cookies.delete :auth_token
  #   redirect_to root_path, notice: "You signed out."
  # end

  def create
    user = User.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: "#{user.name} signed in with #{user.provider} successfully!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You signed out."
  end

end
