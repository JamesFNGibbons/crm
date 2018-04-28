class CreateBusinessContactInfos < ActiveRecord::Migration
  def change
    create_table :business_contact_infos do |t|
      
      t.string :name
      t.string :email
      t.string :phone
      t.string :website
      t.string :notes
      t.string :position
      
      t.timestamps
    end
  end
end
