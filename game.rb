require 'json'
require_relative 'spy.rb'
require_relative 'score_card_printer.rb'
# require_relative 'data/board_spaces.json' # 32 spaces
# require_relative 'data/free_gift_cards.json' # 40 cards
# require_relative 'data/move_cards.json' # 36 cards


class Game
  def initialize(number_of_players)
    @number_of_players = number_of_players
    @bank = number_of_players * 10
    @spy_items = ['Passwords', 'Disguises', 'Code Books', 'Keys']
    select_identities
  end

  def select_identities
    @identities = ["French", "German", "Spanish", "Italian", "Russian", "American"]
    @game_ids = []
    @number_of_players.times do
      identities.shuffle!
      @game_ids << identities[0]
      identities.slice!(0)
    end
    initialize_players
  end

  def initialize_players()
    index = 0
    @players = []
    @number_of_players.times do 
      @players << Spy.new(@game_ids[index], ScoreCardPrinter.new(@identities, @spy_items))
      index += 1
    end
    p @players
  end

  def roll_dice
    @roll = rand(0..6)
  end

end

Game.new(3)