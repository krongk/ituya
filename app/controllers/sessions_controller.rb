# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  
  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    #song: self.current_user =User.find(:first)
		if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(user_path(current_user))
      flash[:notice] = "登录成功"
    else
			flash.now[:error]="登录失败,请检查"
      render :action => 'new'
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "注销成功."
    redirect_back_or_default('/')
  end
end
