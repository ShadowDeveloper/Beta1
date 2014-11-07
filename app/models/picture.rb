class Picture < ActiveRecord::Base

	belongs_to :residence
	has_attached_file :pics, style: { thumb: '120x120', large: '300x400' }
	attr_accessor :pics_file_name


	def original_id
		id = "#{self.id}"
		if id.size == 1
			id = "00#{id}"
		end

		if id.size == 2
			id = "0#{id}"
		end 
		
		if id.size == 3
			id = "#{id}"
		end 
	end
end
