class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.create(content: params[:content], user: User.last, gossip: @gossip)
    redirect_to gossip_path(@gossip.id)
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @comment.update(content: params[:content], user: User.last, gossip: Gossip.find(params[:gossip_id]))
    redirect_to gossip_path(params[:gossip_id])
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      @comments = @gossip.comments
      render 'gossips/show'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end
  
end
