class AddAdInfoToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :ad_info, :text
  end
end
