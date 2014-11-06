class AddResidenceIdToSales < ActiveRecord::Migration
   def self.up
    	add_column :sales, :residence_id, :integer
  	 end

	 def self.down
	   add_column :sales, :residence_id, :integer
	 end
end
