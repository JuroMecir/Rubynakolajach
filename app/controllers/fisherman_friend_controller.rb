class FishermanFriendController < ApplicationController


  def home
    if logged_in?
      @catch  = current_user.catches.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
end
