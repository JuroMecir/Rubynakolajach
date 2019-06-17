class Catch < ApplicationRecord
  belongs_to :user
  belongs_to :area
  belongs_to :fish
  belongs_to :bait
  belongs_to :methodf

  validates_numericality_of :size, :greater_than => 0
  validates_numericality_of :weight, :greater_than => 0
end
