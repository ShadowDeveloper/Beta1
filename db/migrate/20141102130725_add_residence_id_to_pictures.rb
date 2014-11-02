class AddResidenceIdToPictures < ActiveRecord::Migration
    def self.up
    	add_column :pictures, :residence_id, :integer
  	 end

	 def self.down
	   add_column :pictures, :residence_id, :integer
	 end
end
