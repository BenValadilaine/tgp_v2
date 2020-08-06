class ProfilesController < ApplicationController

  def show
    p params[:id]
    @author = User.find_by(first_name: params[:id])
    @author_city = City.find(@author.city_id)
    #{name: City.find(@author.city_id).name, zip_code: City.find(@author.city_id).zip_code, id: City.find(@author.city_id)}
  end

  def create
    puts 'prenom: #{@session_first_name}'
    puts 'nom: #{@session_last_name}'
    puts 'city: #{@session_city}'
    puts 'email: #{@session_email}'
    puts 'pwd: #{@session_pwd}'
    puts 'pwd2: #{@session_pwd2}'
    @user_city = City.create(name: @session_city, zip_code: 10000)
    @user = User.create(first_name: @session_first_name, last_name: @session_last_name, city: @user_city, email: @session_email, password: @session_pwd)
    redirect_to root_path
  end
end
