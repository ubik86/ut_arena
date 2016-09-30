class Player < ApplicationRecord
  belongs_to :team
  has_many   :scores
  has_many   :games, through: :scores
end
