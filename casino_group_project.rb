# require_relative "./main_menu.rb"
# require_relative "./black_jack.rb"
# require_relative "./rock_paper_scissors.rb"
# require_relative "./roulette.rb."
# require_relative "./slots.rb"
# require_relative "./high_low.rb"
# require_relative "./card_class.rb"
# require_relative "./deck_class.rb"
# require_relative "./dice_class.rb"

# require "pry"

# TODO: Work on increasing and decreasing wallet.
### possible work-around: create a variable and add or subtract from the @wallet instance
#### example: @increase_wallet = 50
############# @wallet += 50

class Wallet
  def initialize
    @wallet = 0
  end #end initialize

  attr_accessor :wallet

  def view_balance
    # user can view balance
    @wallet
  end #end view_balance

  def increase_balance(amount)
    # increase user balance
    @wallet += amount #wallet = wallet - amount
  end # end increase_balance

  def decrease_balance(amount)
    # decrease user balance
    @wallet -= amount # wallet = amount + wallet
  end #end decrease_balance
end # end Wallet class

# w = Wallet.new

class Player < Wallet
  attr_accessor :playername

  def initialize
    @playername = playername
    super()
    #####TODO Insert Welcome file with ASCII
    # welcome_menu
  end #end def

  def welcome_menu
    puts
    puts "Welcome to DPL Casino!"
    puts
    puts "Please give us your name: "
    puts
    player_name
  end #end welcome_menu

  def player_name
    @playername = gets.strip.to_s
    puts "Hello, #{@playername}. How much money can you spend at our casino?"
    player_money
  end #end player_name

  def player_money
    puts
    @wallet = gets.strip.tap { |s| s.delete!(",") }.to_i #this will remove commas from user input without regex
    if @wallet <= 0
      puts "Sorry. We don't deal with broke people."
      player_name
    else
      puts
      puts "Thank you! You now have a balance of $#{@wallet}. Have fun at our casino, #{@playername}."
      puts
    end #end if
  end #end player_money
end #end class Player

class CasinoProject #< Player
  def initialize
    super()
    main_menu
  end # end def

  def main_menu
    puts
    puts
    puts "Time to play! Please choose from the following:"
    puts "1) Games"
    puts "2) Cash In/Out"
    puts "3) Exit Casino"
    #accept input and case
    choice = gets.strip.to_i
    case choice
    when 1
      games_menu
    when 2
      cashinout_menu
    when 3
      puts "Thank you for coming, #{@playername}!"
      puts "Goodbye!"
      exit(0)
    else
      puts "That is not a valid option! Please try again!"
      main_menu
    end # end choice
  end # end main_menu

  def games_menu
    puts "Please choose from the following games: "
    puts "1) Roulette"
    puts "2) Black Jack"
    puts "3) Rock, Paper, Scissors"
    puts "4) High Low"
    puts "5) Slots"
    puts "6) Return to Casino Lobby"
    choice = gets.strip.to_i
    case choice
    when 1
      #Roulette - Serena
    when 2
      separator #Black Jack - Chris
    when 3
      bet_input #Rock, Paper, Scissors -- Buzz
    when 4
      highlow #High Low -- Alfreda
    when 5
      Slots.new # Slots -- Amanda
    when 6
      main_menu
    else
      puts
      puts "I'm sorry. #{choice} is not a valid option! Please try again!"
      games_menu
    end #end case
  end # end games_menu

  def cashinout_menu
    puts
    puts "What would you like to do with your money?"
    puts "1) View Balance"
    puts "2) Withdraw and Leave"
    puts "3) Deposit"
    puts "4) Return to Casino Main Lobby"
    puts choice = gets.strip.to_i
    case choice
    when 1
      puts
      puts "Your current balance is: $#{@wallet}."
      puts
      cashinout_menu
    when 2
      puts "Withdrawing money now..."
      @withdraw_money = @wallet.to_i
      decrease_balance(@withdraw_money) #will withdraw the amount gained
      puts
      puts "You have successfully withdrawn $#{@withdraw_money} from your account."
      puts "Thank you for visiting our casino!"
      puts "Please come again! "
      exit
    when 3
      puts
      puts "Your current balance is $#{@wallet}."
      puts "How much would you like to deposit?"
      puts
      print "Enter amount > "
      @deposit_amount = gets.strip.tap { |s| s.delete!(",") }.to_i #removes commas and white space
      increase_balance(@deposit_amount) # will get user deposit and pass it in to the increase_balance(argument), increasing the total wallet amount.
      puts "We are now adding $#{@deposit_amount} to your account!"
      puts
      puts "Your new account balance is $#{@wallet}."
      puts
      cashinout_menu
    when 4
      puts "Returning you to casino lobby..."
      puts
      main_menu
    else
      puts "Invalid Option. Try again!"
    end #end case
  end #cashinout_menu
end # end CasinoProject

# ---- CHOICE 2, BLACK JACK -----

# @wallet = 500

# def separator
#   puts "~" * 100
#   puts
# end



# def deal(player, dealer, decks)
#   2.times do
#     player.push(decks.delete(decks.sample))
#       dealer.push(decks.delete(decks.sample))
#     end
#     display_cards(player)
#   end
  
#   def display_cards(hands)
    
#     i = 0 
#     puts "Players Cards"
#     hands.each do |card|
#       puts "  __________"
#       puts " |          |"
#       puts " |          | "
#       puts " |#{hands[i]}       |"
#       puts " |          |"
#       puts " |__________|"
#       i = i + 1
#     end
#   end
  
#   def dealer_shows(dealers_hand, players_hand, running_total1, running_total2)
#     puts `clear`
    
#     player_final_score(running_total1, running_total2)
#     display_cards(players_hand)
#     puts
#     puts
#     puts "Dealers Cards"
#     i = 0
#     dealers_hand.each do |card|
#       puts "  __________"
#       puts " |          |"
#       puts " |          |"
#       puts " |#{dealers_hand[i]}       |"
#       puts " |          |"
#       puts " |__________|"
#       i = i + 1
#     end
#   end
  
#   def player_final_score(running_total1, running_total2)
    
#     if running_total1 <= 21 && running_total2 <= 21 && running_total2 > running_total1
#       return running_total2
#     else
#       return running_total1
#     end
#   end
  
#   def say_score(hands, person)
#     total1 = calculate_total(hands)[:total1]
#     total2 = calculate_total(hands)[:total2]
#     if total1 == 21 || total2 == 21
#       puts 
#     elsif total1 == total2
#       puts "#{person} has #{total1}"
#     elsif total1 <= 21 && total2 <= 21
#       puts "#{person} has #{total1} or #{total2}"
#     elsif total2 > 21
#       puts  "#{person} has #{total1}"
#     end
#   end
  
#   def calculate_total(array)
#     running_total = {:total1 => 0, :total2 => 0 }
#     ace_present = false 
#     array.each do |card|
#       if card.slice(0) == "A"
#         if ace_present == true
#           running_total[:total1] = running_total[:total1] + 1
#           running_total[:total2] = running_total[:total2] + 1
#         else ace_present == false
#           running_total[:total1] = running_total[:total1] + 1
#           running_total[:total2] = running_total[:total2] + 11
#           ace_present = true
#         end
#       elsif card.slice(0) == "J" || card.slice(0) == "Q" || card.slice(0) == "K" || card.slice(0..1) == "10"
#         running_total[:total1] = running_total[:total1] + 10
#         running_total[:total2] = running_total[:total2] + 10
#       else
#         running_total[:total1] = running_total[:total1] + card.slice(0).to_i
#         running_total[:total2] = running_total[:total2] + card.slice(0).to_i
#       end
#     end
#     running_total
#   end
  
  
#   def player_hit_or_stay(running_total1, running_total2, decks, player, dealer)
#     say_score(player, "Player")
#     if running_total1 > 21 && running_total2 > 21 
#       puts "YOU BUST!"
#       puts "Dealer wins"
#       sleep 1.5
#       puts "GAME OVER :("
#     elsif running_total1 == 21 || running_total2 == 21 
#       puts "BLACKJACK!!!!"
#       running_total1 = calculate_total(player)[:total1]
#       running_total2 = calculate_total(player)[:total2]
#       player_score = player_final_score(running_total1, running_total2)    
#       running_total1 = calculate_total(dealer)[:total1]
#       running_total2 = calculate_total(dealer)[:total2]
#       dealer_score = player_final_score(running_total1, running_total2)
#       puts say_score(dealer, "Dealer")
#       sleep 1
#       result(player_score, dealer_score)
#     elsif running_total1 <= 20 || running_total2 <= 20
#       puts 'Hit(h) or Stay(s)?'
#       answer = gets.chomp.downcase
#       while answer != 'h' && answer != 's'
#         puts 'Press "h" to hit or press "s" to stay'
#         answer = gets.chomp.downcase
#       end
#       if answer == 'h'
#         sleep 1
#         hit(decks, player)
#         system 'clear'
#         display_cards(player)
#         running_total1 = calculate_total(player)[:total1]
#         running_total2 = calculate_total(player)[:total2]
#         player_hit_or_stay(running_total1, running_total2, decks, player, dealer)
#       elsif answer == 's'
#         dealer_shows(dealer, player, running_total1, running_total2)
#         puts "You stayed on #{player_final_score(running_total1, running_total2)}"
#         player_score = player_final_score(running_total1, running_total2)
#         sleep 1
#         running_total1 = calculate_total(dealer)[:total1]
#         running_total2 = calculate_total(dealer)[:total2]
#         puts say_score(dealer, "Dealer")
#         sleep 1
#         dealer_hit_or_stay(decks,running_total1,running_total2, player, dealer, player_score)
#       end
#     end
#   end
  
#   def dealer_hit_or_stay(decks, running_total1,running_total2, player, dealer, player_score)
#     if running_total1 > 21 && running_total2 > 21 
#       puts "Dealer BUST, You WIN!!!!!"
#       sleep 0.5
#       puts "Game Over :)"
#     elsif running_total1 == 21 || running_total2 == 21
#       puts 'DEALER HAS BLACKJACK!'
#       running_total1 = calculate_total(dealer)[:total1]
#       running_total2 = calculate_total(dealer)[:total2] 
#       dealer_score = player_final_score(running_total1, running_total2)
#       result(player_score, dealer_score)
#     elsif running_total1 < 17 && running_total2 < 17
#       puts 'Dealer Hits'
#       hit(decks, dealer)
#       sleep 2
#       dealer_shows(dealer, player, running_total1, running_total2)
#       puts "You stayed on #{player_score}"
#       say_score(dealer, "Dealer")
#       running_total1 = calculate_total(dealer)[:total1]
#       running_total2 = calculate_total(dealer)[:total2] 
#       dealer_hit_or_stay(decks, running_total1,running_total2, player, dealer, player_score)
#     elsif running_total1 >= 17 && running_total1 <= 18
#       gamble = ['yes', 'no']
#       if gamble.sample == 'yes'
#         puts 'Dealer Hits'
#         hit(decks, dealer)
#         sleep 2
#         dealer_shows(dealer, player, running_total1, running_total2)
#         running_total1 = calculate_total(dealer)[:total1]
#         running_total2 = calculate_total(dealer)[:total2] 
#         dealer_hit_or_stay(decks, running_total1,running_total2, player, dealer, player_score)
#       elsif gamble.sample == 'no'
#         puts 'Dealer Stays'
#         sleep 2
#         running_total1 = calculate_total(dealer)[:total1]
#         running_total2 = calculate_total(dealer)[:total2] 
#         dealer_score = player_final_score(running_total1, running_total2)
#         result(player_score, dealer_score)
#       end
#       # if s result(player_score, dealer_score)
#     elsif running_total1 >= 19 && running_total1 <= 20 || running_total2 >= 19 && running_total2 <= 20
#       puts 'Dealer Stays!'
#       running_total1 = calculate_total(dealer)[:total1]
#       running_total2 = calculate_total(dealer)[:total2] 
#       dealer_score = player_final_score(running_total1, running_total2)
#       result(player_score, dealer_score)
#     end
#   end
  
#   def hit(deck, hand)
#     hand.push(deck.delete(deck.sample))
#     calculate_total(hand)
#   end
  
#   # result calc
#   def result(player_score, dealer_score)
#     if player_score == dealer_score
#       puts "Both player got #{player_score}"
#       puts "It's a DRAW!"
#     elsif player_score > dealer_score
#       puts "#{player_score} beats #{dealer_score}"    
#       puts "YOU WIN!!!"
#     elsif dealer_score > player_score
#       puts "#{dealer_score} beats #{player_score}"
#       puts "Dealer wins :("
#     end
#   end
  
#   play again 
#   play_again = 'y'
#   game_streak = 0
#   results = { :wins => 0, :losses => 0, :draws => 0 } # store history
  
#   while play_again == 'y'
#     # initialize decks
#     decks = ['Ah ', '2h ', '3h ', '4h ', '5h ', '6h ', '7h ', '8h ', '9h ', '10h', 'Jh ', 'Qh ', 'Kh ','Ad ', '2d ', '3d ', '4d ', '5d ', '6d ', '7d ', '8d ', '9d ', '10d', 'Jd ', 'Qd ', 'Kd ', 'As ', '2s ', '3s ', '4s ', '5s ', '6s ', '7s ', '8s ', '9s ', '10s', 'Js ', 'Qs ', 'Ks ', 'Ac ', '2c ', '3c ', '4c ', '5c ', '6c ', '7c ', '8c ', '9c ', '10c', 'Jc ', 'Qc ', 'Kc ', 'Ah ', '2h ', '3h ', '4h ', '5h ', '6h ', '7h ', '8h ', '9h ', '10h', 'Jh ', 'Qh ', 'Kh ','Ad ', '2d ', '3d ', '4d ', '5d ', '6d ', '7d ', '8d ', '9d ', '10d', 'Jd ', 'Qd ', 'Kd ', 'As ', '2s ', '3s ', '4s ', '5s ', '6s ', '7s ', '8s ', '9s ', '10s', 'Js ', 'Qs ', 'Ks ', 'Ac ', '2c ', '3c ', '4c ', '5c ', '6c ', '7c ', '8c ', '9c ', '10c', 'Jc ', 'Qc ', 'Kc ']
    
#     # empty arrays to hold all players cards
#     player = []
#     dealer = []   
    
#     def place_bet()
#       puts "$#{@wallet} in wallet"

#       bet_options = [
#         "Place Min. Bet",
#         "Increase Bet",
#         "Exit Game"]
        
#         bet_options.each_with_index do |item, i|
#           print "#{i + 1}: #{item} "
#         end
#         print "> ".colorize(:cyan)
#         puts "Min Bet is $10"
        
#         case gets.strip
#         when "1"
#           min_bet
#           puts "Min. Bet Placed"
          
#         when "2"
#           # puts "@{wallet}" Will add later *********
#           puts "How much would you like to bet?"
#           increase_bet
#         when "3"
#           puts "Come back soon"
#           puts "We will take your money any time"
#           exit!
#         else
#           puts "Invalid input"
#           place_bet
#         end
#       end
    
#       @money_bet = 0
#       @new_wallet_total = 0
      
#       def min_bet
#         min_bet = 10 
#         @money_bet << min_bet
#         end
      
#       def increase_bet
#         puts "How much would you like to bet? ($10 Min.)"
#         print "> "
#         bet_increase = gets.to_i
#         if bet_increase <= @wallet && bet_increase != 0
#           puts "Ok Big Baller! Lets Play!"
        
#         @money_bet << bet_increase
#         elsif bet_increase.to_i > @wallet
#           puts "Sorry, you only have $@{@wallet}. Go get more money!"
#           increase_bet
#         else
#           puts "Invalid Entry. Try Again"
#           increase_bet
#         end
#       end 

#       # player_wins_losses_draws adding/subtracting from wallet?
#        if results[:wins] >= 1
#         @new_wallet_total = @wallet + (@money_bet * 2)
#         @wallet << @new_wallet_total

#         elsif results[:losses] >= 1
#         @new_wallet_total = @wallet - @money_bet
#         @new_wallet_total << @wallet
#        else results[:draws] >= 1
#         @new_wallet_total = @money_bet + @wallet
#         @wallet << @new_wallet_total
#         end
        


#     separator
#     print "                 Welcome to Casino Royale BlackJack"
#     puts
#     separator
#     place_bet
#     # Deal two card to each player
#     deal(player, dealer, decks)
    
#     # player takes turn
#     total1 = calculate_total(player)[:total1] 
#     total2 = calculate_total(player)[:total2] 
#     player_hit_or_stay(total1,total2, decks, player, dealer)
#     total1 = calculate_total(player)[:total1] 
#     total2 = calculate_total(player)[:total2] 
#     p = player_final_score(total1, total2)
#     total1 = calculate_total(dealer)[:total1] 
#     total2 = calculate_total(dealer)[:total2] 
#     d = player_final_score(total1, total2)
    
    
#     sleep 0.5
#     case
#     when d > 21
#       results[:wins] = results[:wins] + 1
#     when p <= 21 && p > d
#       results[:wins] = results[:wins] + 1
#     when p == d
#       results[:draws] = results[:draws] + 1
#     when d <= 21 && d > p
#       results[:losses] = results[:losses] + 1
#     else p > 21
#       results[:losses] = results[:losses] + 1
#     end
    
#   game_streak = game_streak + 1
#   per_wins = (results[:wins].to_f / game_streak.to_f * 100).round(2)
#   puts "_____________________________________"
#   puts "_____________________________________"
#   puts "Current game streak is #{game_streak}"
#   puts "You have won #{results[:wins]}, lost #{results[:losses]} and drawn #{results[:draws]}"
#   puts "You have won #{per_wins}% of the games you have played"
#   puts "_____________________________________"
#   puts "_____________________________________"
  
  
#   # play again?
#   puts "Play again? (y/n)"
  
#   play_again = gets.chomp
  
# end

# ---- CHOICE 3, Rock, Paper, Scissors ----

HANDLER = {
  :rock     => { :rock => :tie,   :paper => :lose,  :scissors => :win},
  :paper    => { :rock => :win,   :paper => :tie,   :scissors => :lose},
  :scissors => { :rock => :lose,  :paper => :win,   :scissors => :tie },
}

# @wallet = 50

def bet_input
  puts "How much would you like to bet?"
  # amount = 
  gets.to.i
  # if amount <= @wallet
  #   play
  # elsif amount >@wallet
  #   puts "sorry, no can do! You only have $#{@wallet} left to play with!"
  #   bet_input
  #   else 
  #   puts "invalid, please try again!"
  #   bet_input  
  # end
  play_RPS
end

def computer
  choice = rand(1..3)
  choice == 1 ? :rock : choice == 2 ? :paper : :scissors
end

def compare(outcome)
  if outcome == :win
    puts "You win!"
    #@amount = bet_input #winning amount
    #@wallet = @wallet + @amount
  elsif outcome == :lose
    puts "You lost!"
    #@amount = bet_input #winning amount
    #@wallet = @wallet + @amount
  else
    puts "Tie game!"
    #@amount = bet_input #winning amount
    #@wallet = @wallet + @amount
  end
end

def play_RPS
  puts '
  
         ROCK PAPER SCISSORS!      

  '
  puts "Enter choice: Rock (1), Paper (2), or Scissors (3)"
  comp_choice = computer
  case gets.chomp.to_s.downcase
    when 'rock', '1'
      puts "You chose     -- Rock --"
      puts "Computer chose: #{comp_choice}"
      compare(HANDLER[:rock][comp_choice])
    when 'paper', '2'
      puts "You chose     -- Paper --"
      puts "Computer chose: #{comp_choice}"
      compare(HANDLER[:paper][comp_choice])
    when 'scissors', '3'
      puts "You chose     -- Scissors --"
      puts "Computer chose: #{comp_choice}"
      compare(HANDLER[:scissors][comp_choice])
    else
      puts "Invalid choice!"
  end
  puts "Would you like to play again? [Y/n]"
  cont = gets.chomp.downcase
  system "clear" or system "cls"
  if cont == "y"
    play_RPS
  else
    puts "Thank you for playing!"
    CasinoProject.new
  end
end #end play


# ---- CHOICE 4, HIGH LOW ----

# require "pry"
# require_relative 'deck_class.rb'
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


# highlow

# ----CHOICE 5, SLOTS GAME ----
class Slots #< CasinoProject
  def slot_requirments
    if @wallet == 0
      puts
      puts "Insufficent funds to play this game!"
      puts "Would you like to cash in more money?"
      puts "Type 'y' for yes or 'n' for no: "
      print " > "
      choice == gets.strip.downcase.to_s
      if choice == "y"
        cashinout_menu
      elsif choice == "n"
        puts "Redirecting you to the main lobby..."
        main_menu
      else
        puts "Invalid option."
        slot_requirments
      end #end if
    else
      puts
      puts
      puts "Welcome to Slots!"
      #TODO print SLOT ASCII
    end # end if
  end #end requirments

  def initialize
    super()
    @roll_1 = ["Cherries", "Grapes", "Lemon"]
    @roll_2 = ["Cherries", "Grapes", "Lemon"]
    @roll_3 = ["Cherries", "Grapes", "Lemon"]
    slot_requirments
    greeting
  end #end def

  def greeting
    begin
      puts
      puts "Please put in $50 dollars"
      print " > $"
      @amount = Integer(gets.strip)
    rescue
      puts "Please enter $50."
      retry
    end # end begin/rescue
    if @amount == 50
      # @update_wallet = Wallet.new
      # @update_wallet.decrease_balance(amount)
      @wallet = @wallet - @amount #currently works at decreasing wallet amount
      # decrease_balance(@amount)

      slot_game
    elsif @amount > 50
      puts "That's too much money to bet!"
      greeting
    else @amount < 50
      puts "Insufficient funds!"
      greeting     end #end if
  end # end greeting

  def slot_game
    roll_1 = @roll_1.sample
    roll_2 = @roll_2.sample
    roll_3 = @roll_3.sample
    puts
    sleep(1)
    print roll_1
    sleep(0.33)
    print "."
    sleep(0.33)
    print "."
    sleep(0.33)
    print "."
    print roll_2
    sleep(0.33)
    print "."
    sleep(0.33)
    print "."
    sleep(0.33)
    print "."
    print roll_3
    puts
    puts
    sleep (0.7)
    if roll_1 == roll_2 && roll_2 == roll_3
      puts "Congrats! You win the $500 Jackpot!"
      puts
      @amount = $500
      @wallet = @wallet + @amount #works on increasing amount
      play_again
      # @update_wallet.increase_balance(amount)
      # increase_balance(@amount)
    else roll_1 != roll_2 && roll_2 != roll_3
      puts
      puts "Oops! Looks like you lose!"
      play_again     end # end if
  end #end slot_game

  def play_again
    puts
    puts "Would you like to play again?"
    puts "Type 'y' for yes or 'n' for no."
    print " > "
    choice = gets.strip.downcase
    if choice == "y"
      slot_requirments
    elsif choice == "n"
      main_menu
    else
      puts "Invalid Option"
      play_again
    end #end if
  end # play_again
end # end Slots



# Wallet.new
CasinoProject.new
