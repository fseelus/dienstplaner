class CreateFloors < ActiveRecord::Migration[7.0]
  def change
    create_table :floors do |t|
      t.string :name
      t.integer :position
      t.references :building, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
