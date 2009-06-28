class Subject < ActiveRecord::Base
  belongs_to :user
	has_many :arts
end
