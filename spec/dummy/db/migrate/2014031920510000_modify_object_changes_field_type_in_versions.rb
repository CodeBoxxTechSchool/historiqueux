class ModifyObjectChangesFieldTypeInVersions < ActiveRecord::Migration
  def change
    change_column :versions, :object_changes, :text, :limit => 4294967295
  end
end
