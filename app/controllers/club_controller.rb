class ClubController < ApplicationController
  def dashboard
    @users = User.all
  end
end
