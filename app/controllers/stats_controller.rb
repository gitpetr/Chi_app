class StatsController < ApplicationController
  def users_in_system
    @users = User.all
  end
end
