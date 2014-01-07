class StatsController < ApplicationController
  layout 'admin'

  before_action do
    redirect_to :root unless current_user && current_user.admin?
  end

  def users_in_system
    @users = User.all
  end
end
