class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :name
      t.references :employee, null: false
      t.references :creator, null: false

      t.timestamps
    end
    add_foreign_key :schedules, :users, column: :employee_id
    add_foreign_key :schedules, :users, column: :creator_id
  end
end
