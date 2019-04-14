class FishermanFriendController < ApplicationController
  def home
  end

  def home
    @micropost = current_user.catches.build if logged_in?
  end

  def help
  end
end
