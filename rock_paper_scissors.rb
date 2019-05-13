
# require_relative './main_menu.rb'
# require_relative './card_class.rb'
# require_relative './deck_class.rb'

HANDLER = {
  :rock     => { :rock => :tie,   :paper => :lose,  :scissors => :win},
  :paper    => { :rock => :win,   :paper => :tie,   :scissors => :lose},
  :scissors => { :rock => :lose,  :paper => :win,   :scissors => :tie },
}

# @wallet = 50

def bet_input
  puts "How much would you like to bet?"
  amount = gets.to.i
  if amount <= @wallet
    play
  elsif amount >@wallet
    puts "sory, no can do! You only have $#{@wallet} left to play with!"
    bet_input
    else 
    puts "invalid, please try again!"
    bet_input  
  end
  play
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

bet_input