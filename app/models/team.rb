class Team < ApplicationRecord
  RED = 1
  BLUE = 2

  NAME = %w(red blue)

  belongs_to :game

  has_many :scores
  has_many :players, through: :scores
  has_many :games, through: :scores


  self::NAME.each do |state|
    define_method "#{state}?" do
      self.team_id == self.class.const_get(state.upcase)
    end
  end

  def name(ret = nil)
    self.class::NAME.each do |state| 
      return state if self.team_id == self.class.const_get(state.upcase)
    end

    ret
  end

  def team_id=(t)
    self[:team_id] = self.class.const_get(t.upcase)
  end

end
