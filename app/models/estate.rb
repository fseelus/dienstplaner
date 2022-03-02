class Estate < ApplicationRecord
  belongs_to :organization

  has_many :buildings, -> { ordered_by_name }, dependent: :destroy
  has_many :floors, -> { sorted }, through: :buildings
end
