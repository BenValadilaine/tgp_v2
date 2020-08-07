class GossipsController < ApplicationController
  def show
    loggedin?
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
    @gossip_city = @gossip.user.city
  end


  def new
    loggedin?
    @gossip = Gossip.new()
  end

  def create
    @current_user = current_user()
    @gossip = Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user: @current_user)
    if @gossip.save
      redirect_to :controller => "landing_page", :action => "index", :notice => "gossip_saved"
    else
      @error = true
      render :action => "new"
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @current_user = current_user()
    @gossip = Gossip.find(params[:id])
    if @current_user == @gossip.user
      @gossip.update(post_params)
      redirect_to gossip_path(@gossip)
    end
  end

  def post_params
    params.require(:gossip).permit(:title, :content)
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to :controller => "landing_page", :action => "index", :notice => "gossip_destroyed"
  end

end
