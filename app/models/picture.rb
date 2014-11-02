class Picture < ActiveRecord::Base

	belongs_to :residence
	has_attached_file :pics, style: { thumb: '120x120', large: '300x400' }
	attr_accessor :pics_file_name
end
