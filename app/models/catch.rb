class Catch < ApplicationRecord
  belongs_to :user
  belongs_to :area
  belongs_to :fish
  belongs_to :bait
  belongs_to :methodf
end
