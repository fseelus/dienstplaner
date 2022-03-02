class Floor < ApplicationRecord
  belongs_to :building
  belongs_to :organization
end
