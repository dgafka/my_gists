class GistsController < ApplicationController

  before_action :check_session, :except => [:index, :show]

  def index
    @site       = params[:id];
    if(!@site)
      @site = 1;
    else
      @site = @site.to_i;
    end
    begins   = @site * 5 - 5;
    limit = 5;

    gistsAmount = Gist.count();
    @siteAmount = (gistsAmount.to_f/5).ceil;
    @gists = Gist.order("gists.created_at DESC").offset(begins).limit(limit);


  end

  def show
    @gist = Gist.find(params[:id]);
    if !@gist.gist_edits.empty?
      @gistEdits = @gist.gist_edits
    end

    end

  def create
    @gist = Gist.new();
    @languages = Language.sorted
  end

  def new
    @gist = Gist.new(section_params)
    if @gist.save
      @gistEdit = GistEdit.new(:summary => "Gist has been created.")
      @gistEdit.gist = @gist;
      @gistEdit.user = User.find(session[:user_id]);

      @gistEdit.save();
      flash[:notice] = "Gist created successfully."
      redirect_to(:action => 'index')
    else
      render('create')
    end
  end

  def edit
    @gist = Gist.find(params[:id])
    @languages = Language.sorted
  end

  def update
    @gist = Gist.find(params[:id])
    if @gist.update_attributes(section_params)
      @gistEdit = GistEdit.new(:summary => params[:summary]["{:size=>\"40x5\", :class=>\"form-control\"}"])
      @gistEdit.gist = @gist;
      @gistEdit.user = User.find(session[:user_id]);

      @gistEdit.save();
      flash[:notice] = "Gist updated successfully."
      redirect_to(:action => 'show', :id => @gist.id)
    else
      render('edit')
    end
  end

  def delete
    @gist = Gist.find(params[:id]);
  end

  def destroy
    Gist.find(params[:id]).destroy;
    flash[:notice] = "Gist deleted successfully."
    redirect_to(:action => 'index')
  end

  def search
    @searchText = params[:search];
    @site       = params[:id];
    if(!@site)
      @site = 1;
    else
      @site = @site.to_i;
    end
    begins   = @site * 5 - 5;
    limit = 5;

    gistsAmount = Gist.where("gists.description LIKE ?", "%#{@searchText}%").count();
    @siteAmount = (gistsAmount.to_f/5).ceil;
    @gists = Gist.where("lower(gists.description) LIKE ?", "%#{@searchText}%").order("gists.created_at DESC").offset(begins).limit(limit);
  end

  private def section_params
            params.require(:gist).permit(:snippet, :language_id, :description)
          end
end
