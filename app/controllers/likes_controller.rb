class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # POST /likes
  # POST /likes.json
  def create
    @current_user = current_user()
    @like = Like.new(user: @current_user, gossip: Gossip.find(params[:format]))
    if Like.find_by(user: @current_user, gossip: Gossip.find(params[:format])) == nil
      @like.save
    else
      destroy
    end
    redirect_back(fallback_location: root_path)
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @current_user = current_user()
    Like.find_by(user: @current_user, gossip: Gossip.find(params[:format])).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.fetch(:like, {})
    end
end
