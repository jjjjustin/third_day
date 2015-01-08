

class Blackjack
  attr_accessor :player

  def initialize
    @user = Player.new
    @dealer = Player.new
  end

  def play
    while @user.dollars > 0
      @user.hand << @user.cards.draw
      @dealer.hand << @dealer.cards.draw
      @user.hand << @user.cards.draw
      @dealer.hand << @dealer.cards.draw
      @user.dollars -= 10
      puts "Player shows #{@user.hand[0]} #{@user.hand[1]} and the dealer shows #{@dealer.hand[0]}"
      puts "Do you want to stay or hit?"
      stay_or_hit = gets.chomp.downcase
        if stay_or_hit == "hit"
          @user.hand << @user.cards.draw
          puts "Player shows [#{@user.hand[0]}], and [#{@user.hand[1]}] and [#{@user.hand[2]}]"
          if @user.hand.reduce(:+) > 21
            puts '-' * 25
            puts "Oh! Your total is #{@user.hand.reduce(:+)} - you're Busted!"
            puts '-' * 25
        else
          puts "OK, your total is  #{@user.hand.reduce(:+)}, and the dealer has #{@dealer.hand.reduce(:+)}"
          puts "Would you like to play again?"
          again = gets.chomp.downcase
            if again == "yes"
              Blackjack.new.play
            else
              puts "Thanks for playing!"

#Shouldn't have all this empty space here - JH
            end
          end
        end
      end
    end

  end

  class Deck # This line should be unindented - JH
  attr_reader :cards
  def initialize
    aces = [11] * 4
    face = [10] * 16
    @cards = ((2..9).to_a * 4).concat(aces).concat(face).shuffle
  end

  def count
    @cards.count
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def draw
    @cards.shift()
  end
end


class Player
  attr_accessor :cards, :dollars, :hand, :score
  def initialize
    @cards = Deck.new
    @dollars = 100
    @score = 0
    @hand = []
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
#identation got a little weird down here. Push all these unindent lines 80-85 - JH 





