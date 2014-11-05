class CreateAcessLogs < ActiveRecord::Migration
  def change
    create_table :acess_logs do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
