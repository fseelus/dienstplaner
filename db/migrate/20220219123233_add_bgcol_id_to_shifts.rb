class AddBgcolIdToShifts < ActiveRecord::Migration[7.0]
  def change
    add_column :shifts, :bgcolor_id, :integer
  end
end
