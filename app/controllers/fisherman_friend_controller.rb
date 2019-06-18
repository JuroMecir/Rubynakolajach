class FishermanFriendController < ApplicationController



  def home
    @population_on_acre =  ActiveRecord::Base.connection.exec_query("SELECT a.name, count(*)  FROM areas a
                                                                      join catches c on a.id = c.area_id
                                                                      group by a.id
                                                                      order by  count(*)")
    @countu = ActiveRecord::Base.connection.exec_query("SELECT count(*) FROM users")
    @countc = ActiveRecord::Base.connection.exec_query("SELECT count(*) FROM catches")

  end

  def urcatches
    if logged_in?
      @catch  = current_user.catches.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

end
