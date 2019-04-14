class CatchesController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

   def create
    @catch = current_user.catches.build(catch_params)
    if @catch.save
      flash[:success] = "Catch created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
  end

  def catch_params
    params.require(:catch).permit(:content)
  end
end
