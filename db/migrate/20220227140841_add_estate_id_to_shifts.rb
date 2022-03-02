class AddEstateIdToShifts < ActiveRecord::Migration[7.0]
  def change
    add_reference :shifts, :estate, null: true, foreign_key: true
  end
end

# pagescontroller?
# to load all the buildings after user selected an estate
# 
