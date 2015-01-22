class Post < ActiveRecord::Base
	has_many :comments
	validates_presence_of :body, :title
	belongs_to :user
end
