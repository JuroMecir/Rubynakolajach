class  CatchesController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy


   def create
    @catch = current_user.catches.build(catch_params)
    if @catch.save
      flash[:success] = "Úlovok pridaný!"
      redirect_to urcatches_url
    else
      @feed_items = []
      render 'fisherman_friend/urcatches'
    end
  end

  def show
    @catch = Catch.find(params[:id])
  end

  def index
    redirect_to root_url
  end

  def destroy
    @catch.destroy
    flash[:success] = "Úlovok odstránený"
    redirect_to request.referrer || root_url

  end

  def catch_params
    params.require(:catch).permit(:weight, :size, :area_id, :fish_id, :bait_id, :methodf_id )
  end

  def correct_user
    @catch = current_user.catches.find_by(id: params[:id])
    redirect_to root_url if @catch.nil?
  end


end
