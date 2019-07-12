class UsersController < ApplicationController
    # include UsersHelper  
    TOGGLE = { "ASC": "DESC", "DESC": "ASC"}

  def index
    @users = User.all
  end

  def import
    User.import(strong_params[:file])

    redirect_to root_url, notice: "Data imported successfully"
  end

  def sort
    @users = User.order(get_field + ' ' + get_direction)
    session[:last_sort] = get_field
    session[:last_direction] = get_direction
  end
  
  private

  def strong_params
    params.permit(:file, :sort)
  end

  def get_field
    strong_params[:sort]
  end

  def get_direction
    return "ASC" if session[:last_direction].nil? || session[:last_sort] != get_field
    TOGGLE[session[:last_direction].to_sym]
  end

  def same_field?(a, b)
    a == b
  end
end
