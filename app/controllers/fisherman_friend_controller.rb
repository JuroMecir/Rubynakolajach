class FishermanFriendController < ApplicationController


  def search

  end

  def home
    @population_on_acre =  ActiveRecord::Base.connection.exec_query("SELECT a.name,100 * count(*)/ a.acreage count FROM areas a
                                                                      join catches c on a.id = c.area_id
                                                                      group by a.id
                                                                      order by 100 * count(*)/a.acreage desc LIMIT 10")
    @countu = ActiveRecord::Base.connection.exec_query("SELECT count(*) FROM users")
    @countc = ActiveRecord::Base.connection.exec_query("SELECT count(*) FROM catches")
=begin
    @carp_places = ActiveRecord::Base.connection.exec_query("SELECT a.name, COUNT(*) FROM catches c
                                                    JOIN fish f on c.fish_id = f.id
                                                    JOIN areas a on c.area_id = a.id
                                                    WHERE c.fish_id = 313
                                                    GROUP BY a.id
                                                    ORDER BY count(*) DESC")
    @Lake_Javier_fish = ActiveRecord::Base.connection.exec_query("SELECT f.name,count(*) FROM fish f
                                                                  join catches c on f.id = c.fish_id
                                                                  join areas a on a.id = c.area_id
                                                                  where a.id = 60
                                                                  group by f.id
                                                                  order by count(*) desc")
    @Pike_baits = ActiveRecord::Base.connection.exec_query("SELECT b.name,count(*) FROM baits b
                                                            join catches c on b.id = c.bait_id
                                                            join fish f on c.fish_id = f.id
                                                            where f.name = 'Pike'
                                                            group by b.id
                                                            order by count(*) desc")
=end
    if logged_in?
      @catch  = current_user.catches.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
end
