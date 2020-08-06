class LandingPageController < ApplicationController

  def index
    @users = User.all
    @gossip = Gossip.all
  end

  def welcome
    @name = params[:name_id]
  end
end
