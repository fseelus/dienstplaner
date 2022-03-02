class Schedule < ApplicationRecord
  belongs_to :employee, :class_name => 'User', :foreign_key => 'employee_id'
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'

  has_many :shifts
end
