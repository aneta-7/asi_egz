class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /links
  # GET /links.json
  def index
    if params[:search]
       @links = Link.all.search(params[:search]).paginate(page: params[:page], per_page: 10)
    elsif params[:my]
       @links = Link.all.paginate(page: params[:page], per_page: 10)
       @my = true
    elsif params[:all]
       @links = Link.all.paginate(page: params[:page], per_page: 10)
       @my = false
    elsif params[:sortDate]
      if params[:sortDate] == "desc"
        @links= Link.all.paginate(page: params[:page], per_page: 10).order('created_at DESC')
        @sd = true;
      else
        @links = Link.all.paginate(page: params[:page], per_page: 10).order('created_at ASC')
        @sd = false;
      end
    elsif params[:sortName]
      if params[:sortName] == "asc"
        @links = Link.all.paginate(page: params[:page], per_page: 10).order('title ASC')
        @sn = true;
      else
        @links = Link.all.paginate(page: params[:page], per_page: 10).order('title DESC')
        @sn = false;
      end
    elsif params[:sortScore]
      if params[:sortScore] == "desc"
        @links = Link.all.paginate(page: params[:page], per_page: 10).order('((cached_votes_up + 1.9208) / (cached_votes_up + cached_votes_down) - 1.96 * ((cached_votes_up * cached_votes_down) / (cached_votes_up + cached_votes_down) + 0.9604) / (cached_votes_up + cached_votes_down)) / (1 + 3.8416 / (cached_votes_up + cached_votes_down)) DESC')
        @ss = true;
      else
        @links = Link.all.paginate(page: params[:page], per_page: 10).order('((cached_votes_up + 1.9208) / (cached_votes_up + cached_votes_down) - 1.96 * ((cached_votes_up * cached_votes_down) / (cached_votes_up + cached_votes_down) + 0.9604) / (cached_votes_up + cached_votes_down)) / (1 + 3.8416 / (cached_votes_up + cached_votes_down)) ASC')
        @ss = false;
      end
    else
       @links = Link.all.paginate(page: params[:page], per_page: 10)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    if params[:sortDate]
      if params[:sortDate] == "desc"
        @sd = true;
      else
        @sd = false;
      end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /links/new
  def new
    @blokadaURL = false
    @link = current_user.links.build
  end

  # GET /links/1/edit
  def edit
    @blokadaURL = true
  end

  # POST /links
  # POST /links.json
  def create
    @link = current_user.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link został pomyślnie dodany.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link został pomyślnie edytowany.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link został pomyślnie usunięty.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_from current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
      @comments = @link.comments.paginate(page: params[:page], per_page: 10).order('created_at ASC')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url)
    end

end
