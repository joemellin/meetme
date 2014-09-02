class Idea < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :cover => "1600x600#", :thumb => "100x100#", :small => "200x200#", :medium => "300x300#"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
