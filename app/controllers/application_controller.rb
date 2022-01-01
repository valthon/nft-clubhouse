class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def current_user
    @current_user ||= begin
                        User.find(session[:user_id]) if session[:user_id].present?
                      end
  end

  def set_current_user(user = nil)
    session[:user_id] = user&.id
    @current_user = user
  end

  private

  def authenticate_user!
    redirect_to new_session_path unless current_user
  end
end
