class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shifts, :foreign_key => 'employee_id', :dependent => :destroy
  has_many :shifts, :foreign_key => 'creator_id', :dependent => :destroy

  has_one :schedule, :foreign_key => 'employee_id', :dependent => :destroy
  has_one :schedule, :foreign_key => 'creator_id', :dependent => :destroy


  def full_name
    first_name + ' ' + last_name
  end

  def has_schedule
    user_schedules = Schedule.where("employee_id = ?", id)
    user_schedules.count > 0
  end
end
