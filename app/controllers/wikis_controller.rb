class WikisController < ApplicationController
  before_filter :authenticate_user!, except: [ :index, :show ]

  after_action :verify_authorized, :except => :index
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Your Wiki has been created!"
      redirect_to @wiki

    else
      flash.now[:alert] = "There was an error, please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki has been updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an issue saving the Wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\"was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleteing the post."
      render :show
    end
  end
end
