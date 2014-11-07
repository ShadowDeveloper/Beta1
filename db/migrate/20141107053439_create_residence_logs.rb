class CreateResidenceLogs < ActiveRecord::Migration
  def change
    create_table :residence_logs do |t|
      t.integer :residence_id
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
