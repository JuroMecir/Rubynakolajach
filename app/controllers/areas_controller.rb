class AreasController < ApplicationController

  def index
    @areas = Area.paginate(page: params[:page])
  end

  def show
    @area = Area.find(params[:id])
    @fish_population = ActiveRecord::Base.connection.exec_query("SELECT f.name,count(*) FROM fish f
                                                                  JOIN catches c on f.id = c.fish_id
                                                                  JOIN areas a on c.area_id = a.id
                                                                  where a.id = '#{@area.id}'
                                                                  group by f.name
                                                                  order by count(*) desc")
  end

end
