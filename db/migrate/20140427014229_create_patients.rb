class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.text :description
      t.integer :hospital_id
      

      t.timestamps
    end
  end
end
