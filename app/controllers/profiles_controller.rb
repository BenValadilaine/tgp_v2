class ProfilesController < ApplicationController

  def show
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$*******"
    p params[:id]
    @author = User.find_by(first_name: params[:id])
  end

end
