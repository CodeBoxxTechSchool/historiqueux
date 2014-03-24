class AddDummyModelIdInHorses < ActiveRecord::Migration
  def change
    add_column :horses, :dummy_model_id, :integer
  end
end
