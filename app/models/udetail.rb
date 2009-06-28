class Udetail < ActiveRecord::Base
  belongs_to :user,:class_name => 'User', :foreign_key => 'user_id'

	file_column :image, :magick=>{:geometry=>'45x60>'}
end
