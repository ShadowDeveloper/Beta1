class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
    	t.string :cpf_owner
      t.string :cpf_client
      t.integer :status

      t.timestamps
    end
  end
end
