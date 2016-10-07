class Player < ApplicationRecord
  has_many   :scores
  has_many   :games, through: :scores
  has_many   :teams, through: :scores
  belongs_to :team

end
