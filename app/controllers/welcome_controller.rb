class WelcomeController < ApplicationController
  layout 'layouts/application_full'
	#网站首页
	def index
		#随机获取一张图片
		arts =Art.find(:all)
		unless arts.empty?
			arr=[]
			arts.collect{|art| arr<<art.id}

			@art =Art.find(arr[rand(arr.length)])
		end
  end

  #关于我们
  def about_us
  end
  #联系我们
  def contact_us
  end
	#提供服务
	def service

	end
end