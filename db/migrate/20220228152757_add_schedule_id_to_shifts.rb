class AddScheduleIdToShifts < ActiveRecord::Migration[7.0]
  def change
    add_reference :shifts, :schedule, null: true, foreign_key: true
  end
end
