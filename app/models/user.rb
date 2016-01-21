class User < ActiveRecord::Base
	attr_accessor :avatar
	has_attached_file :avatar, style: {medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	has_many :posts
	has_many :comments
end
