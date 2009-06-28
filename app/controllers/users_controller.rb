class UsersController < ApplicationController
  # Protect these actions behind an admin login
  # before_filter :admin_required, :only => [:suspend, :unsuspend, :destroy, :purge]
  before_filter :find_user, :only => [:suspend, :unsuspend, :destroy, :purge]
  
	def index
		@users =User.paginate :page =>params[:page]||1, :per_page=>5,:order => 'created_at DESC'
	end

	def show
		@user =User.find(params[:id])
		@udetail = @user.udetail  #用于显示图片信息,显示图片信息必须用实例变量
	end
  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.register! if @user.valid?
    if @user.errors.empty?
			#create default subject
			@user.subjects.create(:name=>'默认专辑',:art_amount=>'0')

      self.current_user = @user

			@udetail = Udetail.create(:user_id => @user.id)
      redirect_to(edit_user_udetail_path([@user,@udetail]))
      flash[:notice] = "用户注册成功,请添加详细信息!"
    else
      render :action => 'new'
			flash.now[:error]="用户注册失败,请检查"
    end
  end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate!
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

  def suspend
    @user.suspend! 
    redirect_to users_path
  end

  def unsuspend
    @user.unsuspend! 
    redirect_to users_path
  end

  def destroy
    @user.delete!
    redirect_to users_path
  end

  def purge
    @user.destroy
    redirect_to users_path
  end

protected
  def find_user
    @user = User.find(params[:id])
  end

end
