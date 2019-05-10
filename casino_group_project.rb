require_relative "./main_menu.rb"
# require_relative "./black_jack.rb"
# require_relative "./rock_paper_scissors.rb"
# require_relative "./roulette.rb."
# require_relative "./slots.rb"
# require_relative "./high_low.rb"

class CasinoProject < Player
  def initialize
    super()
    welcome_menu
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
    end # end choice
  end # end main_menu

  def games_menu
    puts "Please choose from the following games: "
    puts "1) Roulette"
    puts "2) Black Jack"
    puts "3) Rock, Paper, Scissors"
    puts "4) High Low"
    puts "5) Return to Casino Lobby"
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
    when 5
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
      decrease_balance(@withdraw_money) #will withdraw the amount and change wallet amount
      puts
      puts "You have successfully withdrawn $#{@withdraw_money} from your account."
      exit
    when 3
      puts
      puts "Your current balance is $#{@wallet}."
      puts "How much would you like to deposit?"
      puts
      print "Enter amount > "
      @deposit_amount = gets.to_i
      increase_balance(@deposit_amount)
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

CasinoProject.new
