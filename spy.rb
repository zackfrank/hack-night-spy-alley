class Spy
  attr_accessor :current_space

  def initialize(identity, score_card)
    @identity = identity
    @score_card = score_card
    @current_space = 0
  end

end