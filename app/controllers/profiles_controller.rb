class ProfilesController < ApplicationController

  def show
    p params[:id]
    @author = User.find_by(first_name: params[:id])
    @author_city = City.find(@author.city_id)
    #{name: City.find(@author.city_id).name, zip_code: City.find(@author.city_id).zip_code, id: City.find(@author.city_id)}
  end

end
