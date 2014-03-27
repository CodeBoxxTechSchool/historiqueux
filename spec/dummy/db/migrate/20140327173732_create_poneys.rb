class CreatePoneys < ActiveRecord::Migration
  def change
    create_table :poneys do |t|
      t.string :name
      t.integer :age
      t.references :dummy_model, index: true

      t.timestamps
    end
  end
end
