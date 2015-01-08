# ***** Blackjack *****
#
#
#
class Deck
  attr_reader :cards
  def initialize
    aces = [10] * 4
    face = [11] * 4
    @cards = ((2..9).to_a * 4) + (aces) + (face).shuffle
  end

  def count
    @cards.count
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def draw
    @cards.shift
  end
end

class Player
  attr_accessor :cards, :dollars
  def initialize
    @cards = Deck.new
    @dollars = 100
  end
end




class Blackjack
  def initialize
    @user = Player.new
    @dealer = Player.new
  end

  def play
    while @user.dollars > 10 do
      card_one = @dealer.cards.draw
      card_two = @user.cards.draw
      card_three = @dealer.cards.draw
      card_four = @dealer.cards.draw
      @user.dollars -= 10
      puts "Player shows [#{card_one}] and [#{card_three}] and the dealer shows [#{card_two}]"
      puts "Do you want to stay or hit?"
        stay_or_hit = gets.chomp.downcase
        if stay_or_hit == "hit"
          card_five = @user.cards.draw
          puts "Player shows [#{card_five}], and [#{card_one}] and [#{card_three}]"
        elsif stay_or_hit == "stay"
          puts "OK, your total is  (#{card_one} + #{card_three}), and the dealer has (#{card_two} + #{card_four})"
      end
    end

    end
  end

puts "Let's play some Blackjack!"
  puts "Would you like to play a hand?"
    play_again = gets.chomp.downcase
    if play_again == "yes"
      Blackjack.new.play
    else
      puts "Thanks for playing!"


end
