class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def import
    User.import(strong_params[:file])

    redirect_to root_url, notice: "Data imported successfully"
  end

  private

  def strong_params
    params.permit(:file)
  end
end
