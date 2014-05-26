class AddFieldToMedicines < ActiveRecord::Migration
  def change
    add_column :medicines, :patient_id, :integer
  end
end
