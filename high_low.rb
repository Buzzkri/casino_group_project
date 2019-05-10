
# dealer shows random card, must be 2-queen
# user choices high or low
# if correct, pay 2x the bet
# if incorrect, lose bet
# if tie, nothing happens, keep bet
# continue until user leaves game

require "pry"
require_relative 'card'

def greet
  puts "Welcome to High Low, easiest game to play!"
  puts "Let's start by placing a bet."
  place_bet
  high_low
end

def place_bet
  puts" How much would you like to bet?"
  print "> $"
  bet = gets.to_i
  case bet
    if bet <= @wallet && bet != 0
      puts "Ok bigballer, let's play."
      high_low
    elsif bet > @wallet
      puts "Ok bigballer, you only have $#{@wallet} to play with. Try again."
      place_bet
    else
      puts "Invalid Entry. Try again."
      place_bet
    end
end

def high_low
  puts "Dealer shows "
end
