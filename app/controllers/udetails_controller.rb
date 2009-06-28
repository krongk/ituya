class UdetailsController < ApplicationController
  layout "layouts/application_full"
	before_filter :login_required
	before_filter :load_user
	def load_user
		@user =current_user || User.find(params[:user_id])
	end
	# GET /udetails
  # GET /udetails.xml
  def index

  end

  # GET /udetails/1
  # GET /udetails/1.xml
  def show
    if params[:user_id]
			@udetail = User.find(params[:user_id]).udetail
		else
		  @udetail = Udetail.find(params[:id])
		end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @udetail }
    end
  end
 
  #去掉了new,create方法,这在UserController中实现

  # GET /udetails/1/edit
  def edit
    @udetail = User.find(params[:user_id]).udetail
  end

  # PUT /udetails/1
  # PUT /udetails/1.xml
  def update
    @udetail = @user.udetail
		@udetail.user_id = @user.id

		if @udetail.update_attributes(params[:udetail])
			flash[:notice]='信息更新成功'
			redirect_to(user_path(@user))
		else
			flash[:notice]='信息更新失败'
			render :action=>"edit"
		end
  end

  # DELETE /udetails/1
  # DELETE /udetails/1.xml
  def destroy
    @udetail = Udetail.find(params[:id])
    @udetail.destroy

    respond_to do |format|
      format.html { redirect_to(user_udetails_url) }
      format.xml  { head :ok }
    end
  end
end
