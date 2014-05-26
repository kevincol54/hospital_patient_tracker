class AddFieldToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :treatable_type, :string
  end
end
