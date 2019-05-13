require "pry"
require_relative 'deck_class.rb'
# require_relative  "Wallet"

@wallet = 50

def highlow
  greet
  place_bet
  deal_cards
  update_wallet
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

def deal_cards
  puts "Dealer shows:"
  deck = Deck.new # make deck instance variable? @deck?
  shuffle = deck.shuffle_cards
  deal = shuffle.shift
  next_card = shuffle.shift
  # card_1 = shuffle.first
  # card_2 = shuffle[1]
  # dealer shows top card, must be 2-queen
  if deal.rank == "A" || deal.rank == "K" 
    puts "Whoops. Next card shows:"
    puts "#{shuffle.shift.rank} #{shuffle.shift.suit}"
    # what if card_2 is also A or K?
  else puts "#{deal.rank} #{deal.suit}"
  end
  
  puts "What do you think the next card is: high or low?"
  print "> "
  choice = gets.strip.downcase # true false statement
    case choice
      when "high"
        puts "Let's see if Lady Luck is on your side..."
        puts "#{next_card.rank} #{next_card.suit}" # dealer reveals next card
        if next_card.rank > deal.rank ? "You won." : "You lost."
        else next_card.rank == deal.rank ? "You tied."
        end
      when "low"
        puts "Let's see if Lady Luck is on your side..."
        puts "#{next_card.rank} #{next_card.suit}" # dealer reveals next card
        if next_card.rank < deal.rank ? "You won." : "You lost."
        else next_card.rank == deal.rank ? "You tied."
        end
      else
        puts "Invalid selection. Try again."
    end

  binding.pry
 
   # code broken after this line
  # if choice == "high" && next_card.rank > deal.rank ? "You won." : "You lost."
  #   #puts "It's higher, you won!"
  # elsif choice == "low" && next_card.rank < deal.rank ? "You won." : "You lost."
  #   #puts "It's lower, you won!"
  # else next_card.rank == deal.rank
  #   puts "It's a tie."
  # end 
  
end

# def high_choice
#   # true false statement
#   # if high, and card is higher than previous card, then win
#   # if low, and card is lower than previous card, then lose
# end

# case choice
#   when "high"
#     high_choice
#   when "low"
#     low_choice
#   else 
#     puts "Invalid entry, enter "high" or "low"."
# end

def update_wallet
# if correct, pay 2x the bet
# if incorrect, lose bet
# if tie, nothing happens, keep bet
end



# continue until user leaves game


highlow

