class Doctor < ApplicationRecord
  has_many :patients
  has_many :appointments, through: :patients
end
