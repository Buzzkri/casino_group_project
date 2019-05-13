require "pry"
require_relative 'deck_class.rb'
# require_relative  "Wallet"

@wallet = 50

def highlow
  greet
  place_bet
  show_card
  user_choice
end

def greet
  puts "Welcome to High Low, easiest game to play!"
  puts "Let's start by placing a bet."
end

def place_bet
  puts "How much would you like to bet?"
  print "> $"
  bet = gets.to_i
  if bet <= @wallet && bet != 0
    puts "Ok bigballer, let's play."
  elsif bet > @wallet
    puts "Ok bigballer, you only have $#{@wallet} to play with. Try again."
    place_bet
  else
    puts "Invalid Entry. Try again."
    place_bet
  end
end

def show_card
  puts "Dealer shows:"
  deck = Deck.new
  shuffle = deck.shuffle_cards
  deal = shuffle.shift
  next_card = shuffle.first
  # card_1 = shuffle.first
  # card_2 = shuffle[1]
  binding.pry
   if shuffle.shift == "A" || shuffle.shift == "K"
      puts "Whelp, that's a bust. Next card shows:"
      puts "#{next_card.rank} #{next_card.suit} (#{next_card.color})"
   else puts "#{deal.rank} #{deal.suit} (#{deal.color})"
      # what if card_2 is also A or K?
   end
  puts "What do you think, high or low?"
  choice = gets.strip.downcase
  puts "#{deal.rank} #{deal.suit} (#{deal.color})"

  #   shuffle.each_with_index do |top_card, i|
  #     next if shuffle[0] == "A" || shuffle.slice(0) == "K"
  #     puts top_card.first
  #   end
    # "#{top_card.rank} #{top_card.suit} (#{top_card.color})"
  # dealer shows top card, must be 2-queen
end


def user_choice
  
  # dealer reveals next card
  # if high, and card is higher than previous card, then win
  # if low, and card is lower than previous card, then lose
  

end


# if correct, pay 2x the bet
# if incorrect, lose bet
# if tie, nothing happens, keep bet
# continue until user leaves game


highlow

