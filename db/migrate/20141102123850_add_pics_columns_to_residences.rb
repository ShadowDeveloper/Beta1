class AddPicsColumnsToResidences < ActiveRecord::Migration
   def self.up
    add_attachment :residences, :pics
  end

  def self.down
    remove_attachment :residences, :pics
  end
end
