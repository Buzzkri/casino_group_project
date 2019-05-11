# require_relative "main_menu.rb"
require_relative "./casino_group_project.rb"

# require "pry"
# require "colorize"

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
    initialize_roll
  end # end if
end #end requirments
# class Slots
def initialize_roll
  @roll_1 = ["Cherries", "Grapes", "Lemon"]
  @roll_2 = ["Cherries", "Grapes", "Lemon"]
  @roll_3 = ["Cherries", "Grapes", "Lemon"]
  greeting
end #end def

def greeting
  begin
    puts
    puts "Please put in $50 dollars"
    print " > $"
    @user_cash = Integer(gets.strip)
  rescue
    puts "Please enter $50."
    retry
  end # end begin/rescue
  if user_cash == 50
    decrease_balance(@user_cash)
    slot_game
  elsif @user_cash > 50
    puts "That's too much money to bet!"
    greeting
  else user_cash < 50
    puts "Insufficient funds!"
    greeting   end #end if
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
    play_again
  else roll_1 != roll_2 && roll_2 != roll_3
    puts
    puts "Oops! Looks like you lose!"
    play_again   end # end if
end #end slot_game

def play_again
  puts
  puts "Would you like to play again?"
  puts "Type 'y' for yes or 'n' for no."
  print " > "
  choice = gets.strip.downcase
  if choice == "y"
    greeting
  elsif choice == "n"
    main_menu
  else
    puts "Invalid Option"
    play_again
  end #end if
end # play_again
# end # end Slots

# Slots.new
