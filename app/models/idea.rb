class Idea < ActiveRecord::Base
	belongs_to :user
	has_many :iterations

	accepts_nested_attributes_for :iterations, :reject_if => :all_blank, :allow_destroy => true

	has_attached_file :image, :styles => { :cover => "1600x250#", :thumb => "100x100#", :small => "200x200#", :medium => "300x300#"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
