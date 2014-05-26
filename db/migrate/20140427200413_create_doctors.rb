class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :treatble_type
      t.integer :treatable_id


      t.timestamps
    end
  end
end
