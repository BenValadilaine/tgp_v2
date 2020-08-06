class ProfilesController < ApplicationController

  def show
    loggedin?
    p params[:id]
    @author = User.find_by(first_name: params[:id])
    @author_city = City.find(@author.city_id)
    #{name: City.find(@author.city_id).name, zip_code: City.find(@author.city_id).zip_code, id: City.find(@author.city_id)}
  end

  def new

  end

  def create
    @user_city = City.create(name: params[:city], zip_code: 67000)
    puts "*"*30
    puts @user_city
    if params[:password] == params[:password_confirm]
      @user = User.create(first_name: params[:first_name], last_name: params[:last_name], age: params[:age], city: @user_city, email: params[:email], password: params[:password])
      redirect_to root_path
    else
      #penser à mettre un flash
      render :action => "new"
    end


  end
end
