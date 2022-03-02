class Building < ApplicationRecord
  belongs_to :estate
  belongs_to :organization

  has_many :floors, -> { sorted }, inverse_of: :building,
    dependent: :destroy

  has_many :shifts

end
