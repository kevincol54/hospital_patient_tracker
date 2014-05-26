class CreateJoinTables < ActiveRecord::Migration
  def change
    create_table :join_tables do |t|
      t.integer :hospital_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
