class CatchesController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

   def create
    @catch = current_user.catches.build(catch_params)
    if @catch.save
      flash[:success] = "Catch created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'fisherman_friend/home'
    end
  end

  def destroy
    @catch.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url

  end

  def catch_params
    params.require(:catch).permit(:weight, :size)
  end

  def correct_user
    @catch = current_user.catches.find_by(id: params[:id])
    redirect_to root_url if @catch.nil?
  end

end
