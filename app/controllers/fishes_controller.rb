class FishesController < ApplicationController

  def index
    @fishes = Fish.all
  end

  def show
    @fish = Fish.find(params[:id])
    @bait = ActiveRecord::Base.connection.exec_query("SELECT b.name,count(*) FROM baits b
                                                      JOIN catches c on b.id = c.bait_id
                                                      where c.fish_id = '#{@fish.id}'
                                                      group by b.name
                                                      order by count(*) desc LIMIT 10")

    @area = ActiveRecord::Base.connection.exec_query("SELECT a.name,count(*) FROM areas a
                                                      JOIN catches c on a.id = c.area_id
                                                      where c.fish_id = '#{@fish.id}'
                                                      group by a.name
                                                      order by count(*) desc LIMIT 10 ")
    @method = ActiveRecord::Base.connection.exec_query("SELECT m.name,count(*) FROM methodfs m
                                                      JOIN catches c on m.id = c.methodf_id
                                                      where c.fish_id = '#{@fish.id}'
                                                      group by m.name
                                                      order by count(*) desc LIMIT 10")


  end

end
