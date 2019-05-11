
# require “pry”
# Create a wallet that will be initialize on game creation

#Have options to :
# - view user balance
# - increase your balance (Deposit)
# - decrease your balance  (Withdraw and leave the casino with total amount earned)

#TODO: Fix - When user enters amount using commas into wallet, the program only takes the ints before the commas

class Wallet
  attr_accessor :wallet

  def initialize
    @wallet = 0
  end #end initialize

  def view_balance
    # user can view balance
    @wallet
  end #end view_balance

  def increase_balance(amount)
    # increase user balance
    @wallet += amount  #wallet = wallet - amount
  end # end increase_balance

  def decrease_balance(amount)
    # decrease user balance
    @wallet -= amount  # wallet = amount + wallet
  end #end decrease_balance
end # end Wallet class

w = Wallet.new

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
    @wallet = gets.strip.to_i
    if @wallet <= 0
      puts "Sorry. We don't deal with broke people."
    else
      puts
      puts "Thank you! You now have a balance of $#{@wallet}. Have fun at our casino, #{@playername}."
      puts
    end #end if
  end #end player_money
end #end class Player

p = Player.new

# Player.new
