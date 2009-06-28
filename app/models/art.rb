class Art < ActiveRecord::Base
  belongs_to :subject
	has_many :comments

	validates_format_of :image,   
       :with=>/^.*(.jpg|.JPG|.gif|.GIF|.png|.PNG)$/,   
       :message => "��ֻ���ϴ�JPG����GIF��ͼƬ�ļ�"  

	file_column :image, :magick=>{
		:crop =>'1:1',
		:versions=>{:medium=>'632x',:thumb=>'450x',:small=>'120x'}
	}
end
