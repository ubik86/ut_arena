class Team < ApplicationRecord
  has_many :scores
  has_many :games, through: :scores
  has_many :players, through: :scores


end
