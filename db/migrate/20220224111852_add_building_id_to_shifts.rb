class AddBuildingIdToShifts < ActiveRecord::Migration[7.0]
  def change
    add_reference :shifts, :building, null: true, foreign_key: true
  end
end
