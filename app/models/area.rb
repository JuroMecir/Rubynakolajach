class Area < ApplicationRecord
  belongs_to :owner
  has_many :catches

end
