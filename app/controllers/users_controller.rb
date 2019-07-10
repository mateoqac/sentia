class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @users = User.all
  end

  def import
    User.import(strong_params[:file])

    redirect_to root_url, notice: "Data imported successfully"
  end

  def sort
    @users = User.order(sort_column + " " + sort_direction)
    respond_to do |format|
      format.js { render 'sort'}
    end
  end
  private

  def strong_params
    params.permit(:file, :sort, :direction)
  end

  def sort_column
    strong_params[:sort] || 'name'
  end

  def sort_direction
    strong_params[:direction] || 'asc'
  end
end
