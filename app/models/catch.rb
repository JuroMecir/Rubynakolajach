class Catch < ApplicationRecord

  default_scope -> { order(created_at: :desc) }

  belongs_to :user
  validates :user_id, presence: true
=begin
  validates :area_id, presence: true
  validates :fish_id_id, presence: true
  validates :method_id_id, presence: true
  validates :time_id_id, presence: true
=end
  validates :size, presence: true
  validates :weight, presence: true
  validates_numericality_of :size
  validates_numericality_of :weight

end
