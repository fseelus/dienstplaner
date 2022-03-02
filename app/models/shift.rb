class Shift < ApplicationRecord
  belongs_to :schedule
  belongs_to :floor
  belongs_to :employee, :class_name => 'User', :foreign_key => 'employee_id'
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :bulding, :class_name => 'Building', :foreign_key => 'building_id'

  scope :all_from_one_building, -> { where(building_id: 1) }
  scope :all_from_one_employee, ->(employee_id) { where("employee_id = ?", employee_id) }

end
