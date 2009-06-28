class FollowsController < ApplicationController
  #before_filter :login_required
	#before_filter :load_user

	def load_user
		@user = User.find(params[:user_id]) || current_user
	end

	# GET /follows
  # GET /follows.xml
  def index
    @follows = @user.follows.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @follows }
    end
  end

  # GET /follows/1
  # GET /follows/1.xml
  def show
    @follow = @user.follows.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @follow }
    end
  end

  # GET /follows/new
  # GET /follows/new.xml
  def new
    @follow = @user.follows.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @follow }
    end
  end

  # GET /follows/1/edit
  def edit
    @follow = Follow.find(params[:id])
  end

  # POST /follows
  # POST /follows.xml
  def create
    @follow = Follow.new
		@follow.user_id =params[:user_id]
		@follow.the_followed_id=current_user.id
		
    respond_to do |format|
      if @follow.save
        flash[:notice] = 'Follow was successfully created.'
        format.html { redirect_to([@user,@follow]) }
				format.js 
        format.xml  { render :xml => @follow, :status => :created, :location => @follow }
      else
        format.html { render :action => "new" }
				format.js
        format.xml  { render :xml => @follow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /follows/1
  # PUT /follows/1.xml
  def update
    @follow = Follow.find(params[:id])

    respond_to do |format|
      if @follow.update_attributes(params[:follow])
        flash[:notice] = 'Follow was successfully updated.'
        format.html { redirect_to(@follow) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @follow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /follows/1
  # DELETE /follows/1.xml
  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy

    respond_to do |format|
      format.html { redirect_to(user_follows_url(@user)) }
      format.xml  { head :ok }
    end
  end

	#follow
	def follow
		render :text=>'follow'
	end
end
