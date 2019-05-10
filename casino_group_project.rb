require_relative "./main_menu.rb"
require_relative "./black_jack.rb"
require_relative "./rock_paper_scissors.rb"
require_relative "./roulette.rb."
require_relative "./slots.rb"
require_relative "./high_low.rb"

#testing commit

class CasinoProject < Player
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
      #cashinout_menu
    when 3
      puts "Thank you for coming, #{@playername}!"
      puts "Goodbye!"
      exit(0)
    else
      puts "That is not a valid option! Please try again!"
    end # end choice
  end # end main_menu

  def games_menu
    puts "1) Roulette"
    puts "2) Black Jack"
    puts "3) Rock, Paper, Scissors"
    puts "4) High Low"
    choice = gets.strip.to_i
    case choice
    when 1
      #Roulette
    when 2
      #Black Jack
    when 3
      #Rock, Paper, Scissors
    when 4
      #High Low
    else
      puts
      puts "I'm sorry. #{choice} is not a valid option! Please try again!"
      games_menu
    end #end case
  end # end games_menu
end # end CasinoProject

Casino.new
