class CreateDummyModels < ActiveRecord::Migration
  def change
    create_table :dummy_models do |t|

      t.text :field1
      t.text :field2
      t.text :field3
      t.timestamps

    end
  end
end
