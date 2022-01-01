class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  # If you're using a strategy that POSTs during callback, you'll need to skip the authenticity token check for the callback action only.
  skip_before_action :verify_authenticity_token, only: :create

  def new
    session[:user_id] = nil
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    raise 'poop' unless @user.valid?
    set_current_user(@user)
    redirect_to club_path
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
