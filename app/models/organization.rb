class Organization < ApplicationRecord
  has_many :estates,                  dependent: :destroy
  has_many :buildings,                dependent: :destroy
  has_many :floors,                   dependent: :destroy
end
