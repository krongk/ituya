class ArtsController < ApplicationController
	before_filter :login_required, :except=>[:index,:show]
	before_filter :load_user
	def load_user
		@user = current_user
	end

	# GET /arts
  # GET /arts.xml
  def index
    # @arts =Art.all(:order => "updated_at DESC")
		@arts =Art.paginate :page =>params[:page]||1, :per_page =>1,:order=>"updated_at DESC" 
    if @user 
			@subjects = @user.subjects
		else 
			@subjects = Subject.all
		end
		
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @arts }
    end
  end

  # GET /arts/1
  # GET /arts/1.xml
  def show
    @art = Art.find(params[:id])
		@user = User.find(@art.user_id)
		@udetail = @user.udetail
		@comment = @art.comments.build

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @art }
    end
  end

  # GET /arts/new
  # GET /arts/new.xml
  def new
    @art = Art.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @art }
    end
  end

  # GET /arts/1/edit
  def edit
    @art = Art.find(params[:id])
  end

  # POST /arts
  # POST /arts.xml
  def create
    @art = Art.new(params[:art])
		@art.user_id = @user.id

    respond_to do |format|
      if @art.save
        flash[:notice] = 'Art was successfully created.'
        format.html { redirect_to(@art) }
        format.xml  { render :xml => @art, :status => :created, :location => @art }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @art.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /arts/1
  # PUT /arts/1.xml
  def update
    @art = Art.find(params[:id])

    respond_to do |format|
      if @art.update_attributes(params[:art])
        flash[:notice] = 'Art was successfully updated.'
        format.html { redirect_to(@art) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @art.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.xml
  def destroy
    @art = Art.find(params[:id])
    @art.destroy

    respond_to do |format|
      format.html { redirect_to(arts_url) }
      format.xml  { head :ok }
    end
  end
end
