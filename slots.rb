require_relative "main_menu.rb"
require_relative "casino_group_project.rb"

# require "pry"
# require "colorize"
class Slots
  def slot_requirments
    @player_wallet = Player.new
    if @player_wallet.player_money == 0
      puts
      puts "Insufficent funds to play this game!"
      puts "Would you like to cash in more money?"
      puts "Type 'y' for yes or 'n' for no: "
      print " > "
      choice == gets.strip.downcase.to_s
      if choice == "y"
        # cashinout_menu
      elsif choice == "n"
        puts "Redirecting you to the main lobby..."
        # main_menu
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
    @update_wallet = Wallet.new
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
      amount = Integer(gets.strip)
    rescue
      puts "Please enter $50."
      retry
    end # end begin/rescue
    if amount == 50
      @update_wallet.decrease_balance(amount)
      slot_game
    elsif amount > 50
      puts "That's too much money to bet!"
      greeting
    else amount < 50
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
      amount = $500
      @update_wallet.increase_balance(amount)
      play_again
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
      greeting
    elsif choice == "n"
      # main_menu
    else
      puts "Invalid Option"
      play_again
    end #end if
  end # play_again
end # end Slots

# binding.pry
# slot_requirments
# Slots.new
