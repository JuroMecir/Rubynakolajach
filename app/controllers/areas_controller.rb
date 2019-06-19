class AreasController < ApplicationController

  def index
    @areas = Area.search(params[:search]).paginate(page: params[:page])
  end

  def show
    @area = Area.find(params[:id])
    @fish_population = ActiveRecord::Base.connection.exec_query("SELECT f.name,count(*) FROM fish f
                                                                  JOIN catches c on f.id = c.fish_id
                                                                  where c.area_id = '#{@area.id}'
                                                                  group by f.name
                                                                  order by count(*) desc")
    @heaviest = ActiveRecord::Base.connection.exec_query("SELECT max(c.weight) FROM catches c
                                                      where c.area_id = '#{@area.id}'")
    @largest = ActiveRecord::Base.connection.exec_query("SELECT max(c.size) FROM catches c
                                                      where c.area_id = '#{@area.id}'")
    @avgsize = ActiveRecord::Base.connection.exec_query("SELECT round(avg(c.size),1) FROM catches c
                                                      where c.area_id = '#{@area.id}'")
    @avgweight = ActiveRecord::Base.connection.exec_query("SELECT round(avg(c.weight),1) FROM catches c
                                                      where c.area_id = '#{@area.id}'")
  end

end
