class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.string :name
      t.date :startdate
      t.date :enddate
      t.references :floor, null: false, foreign_key: true
      t.references :employee, null: false
      t.references :creator, null: false

      t.timestamps
    end
    add_foreign_key :shifts, :users, column: :employee_id
    add_foreign_key :shifts, :users, column: :creator_id
  end
end
