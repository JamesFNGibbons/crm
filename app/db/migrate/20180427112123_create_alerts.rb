class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
  
      t.string :title
      t.string :content
      t.string :priority
      t.integer :user_id
      
      t.timestamps
    end
  end
end
