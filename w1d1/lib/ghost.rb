class Game

  attr_reader :players, :fragment, :dictionary

  def initialize(players, dictionary)
    @players = players
    @dictionary = dictionary
    @fragment = ""
  end

  def play_round

  end

  def current_player
    if @current_player.nil?
      @current_player = select_rand_player
    end
  end

  def previous_player
      # current_player
      @players.select {|player| player != current_player}

  end

  def next_player
    @current_player, @previous_player = @previous_player, @current_player

  end

  def select_rand_player
    players[players.keys[rand(2)]]
  end
end
