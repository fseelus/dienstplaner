class CreateEstates < ActiveRecord::Migration[7.0]
  def change
    create_table :estates do |t|
      t.string :name
      t.string :city
      t.string :zipcode
      t.string :street
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
