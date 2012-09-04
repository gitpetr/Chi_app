class StatsController < ApplicationController
  before_filter do
    redirect_to :root unless current_user && current_user.admin?
  end

  def users_in_system
    @users = User.all
  end
end
