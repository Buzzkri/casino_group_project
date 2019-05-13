# require_relative './main_menu.rb'
# require_relative './card_class.rb'
# require_relative './deck_class.rb'


require "pry"
require_relative 'deck_class.rb'
# require_relative  "Wallet"

@wallet = 50

def highlow
  greet
  place_bet
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
    show_card
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
  card_1 = deck.cards.first
  puts "#{card_1.rank} #{card_1.suit} (#{card_1.color})"
end


# new_deck = deck.shuffle_cards >>> use this when user plays another round
# def first_card
#   deck.first
# end

# dealer shows random card, must be 2-queen
# user choices high or low
# if correct, pay 2x the bet
# if incorrect, lose bet
# if tie, nothing happens, keep bet
# continue until user leaves game


highlow

