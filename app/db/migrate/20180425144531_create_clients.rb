class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
  
      t.string :business
      t.integer :contact_info
      t.string :website
      t.string :notes
      
      t.timestamps
    end
  end
end
