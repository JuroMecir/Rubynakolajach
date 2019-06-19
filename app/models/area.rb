class Area < ApplicationRecord
  has_many :catches

  def self.search(search)
    if search
      where(["lower(unaccent(name)) LIKE lower(unaccent(?))","%#{search}%" ]).or(where(["lower(unaccent(owner)) LIKE lower(unaccent(?))","%#{search}%" ]))
    else
      all
    end
  end

  scope :ordered_by_name, -> { order("areas.name ASC") }
end
