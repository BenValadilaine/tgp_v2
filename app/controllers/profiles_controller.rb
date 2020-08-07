class ProfilesController < ApplicationController

  def show
    loggedin?
    @author = User.find_by(first_name: params[:id])
    @author_city = City.find(@author.city_id)
  end

  def new

  end

  def create
    @user_city = City.create(name: params[:city], zip_code: 67000)
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], city: @user_city, email: params[:email], password: params[:password])
    if params[:password] == params[:password_confirm] && @user.save
      redirect_to root_path :notice => "success"
    else
      redirect_to new_profile_path :notice => "failure"
    end


  end
end
