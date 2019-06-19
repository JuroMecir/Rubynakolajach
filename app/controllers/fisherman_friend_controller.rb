class FishermanFriendController < ApplicationController



  def home
    @population =  ActiveRecord::Base.connection.exec_query("SELECT a.name, count(*)  FROM areas a
                                                                      join catches c on a.id = c.area_id
                                                                      group by a.id
                                                                      order by  count(*) DESC LIMIT 10")
    @fishspecies =  ActiveRecord::Base.connection.exec_query("SELECT f.name, count(*)  FROM fish f
                                                                      join catches c on f.id = c.fish_id
                                                                      group by f.id
                                                                      order by  count(*) Desc")

  end

  def urcatches
    if logged_in?
      @catch  = current_user.catches.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

end
