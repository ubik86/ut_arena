class Score < ApplicationRecord
  belongs_to :player
  belongs_to :game
  belongs_to :team

end
