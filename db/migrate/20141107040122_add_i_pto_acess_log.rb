class AddIPtoAcessLog < ActiveRecord::Migration
  	def self.up
    	add_column :acess_logs, :ip, :string
  	end

	def self.down
	   add_column :acess_logs, :ip, :string
	end
end
