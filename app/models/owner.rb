class Owner < ApplicationRecord
  belongs_to :district
  has_many :areas
end
