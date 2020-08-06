class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
  end

  def new
    @gossip = Gossip.new()
  end

  def create
    @gossip = Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user: User.last)
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
    @gossip = Gossip.find(params[:id])
    @gossip.update(post_params)
    redirect_to gossip_path(@gossip)
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
