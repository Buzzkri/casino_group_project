require "pry"
require_relative 'main_menu.rb' 


class Roulette 
  attr_accessor :wallet

  def initialize(wallet, playername)
    @wallet = wallet
    @playername = playername
    @max_bet = 200
    @min_bet = 50

    @wheel = [{1 => "red"},
      {2 => "black"}, {3 => "red"},{4 => "black"}, {5 => "red"},
      {6 => "black"}, {7 => "red"}, {8 => "black"}, {9 => "red"}, 
      {10 => "black"}, {11 => "black"}, {12 => "red"}, {13 => "black"}, 
      {14 => "red"}, {15 => "black"}, {16 => "red"}, {17 => "black"},
      {18 => "red"}, {19 => "red"}, {20 => "black"}, {21 => "red"},
      {22 => "black"}, {23 => "red"}, {24 => "black"}, {25 => "red"}, 
      {26 => "black"}, {27 => "red"}, {28 => "black"}, {29 => "black"}, 
      {30 => "red"}, {31 => "black"}, {32 => "red"}, {33 => "black"}, 
      {34 => "red"}, {35 => "black"}, {36 => "red"},
    ]
    puts "Hello! Welcome to Roulette!"

    puts "Minimum bet is $50"
    user_money
  end


  def user_money
    if @wallet >= 50
      puts "How much would you like to bet? (Min bet:$50/ Max bet: $200)"
      print "$"
      @amount = gets.to_i

      if @amount < @min_bet || @amount > @max_bet
        puts "I'm sorry! Not allowed, please check the minimum and maximum bet!"
        user_money
      else
        puts "You have bet $#{@amount}."
        roulette_game
      end
    else
      puts "I'm sorry, you don't have enough for the minimum bet. Please add more money to play with us!"
      puts "See you later!"
     end
  end 


  def spin_wheel
    @ball_landed = @wheel.sample
  end

  def quit_or_not
    puts "If you want to quit, just type: quit"
    puts "Just type anything else if you want to continue playing!"
    answer = gets.strip

    case answer
      when "quit"
        puts "Goodbye"
        puts @wallet
        return @wallet
        
      else  
        user_money
    end
  end

  def roulette_game
    print `clear`
    puts "What is your bet?"
    puts "1) Red or black"
    puts "2) Even or odd"
    puts "3) High or low"

    user_choice= gets.strip.to_i

    case user_choice
      when 1 
        red_black
      when 2 
        even_odd
      when 3 
        high_low
    end
  end

  def red_black
    choices = ["red", "black"]
    puts "Which one are you choosing?"
    puts "1) Red"
    puts "2) Black"
    answer_color = gets.strip.to_i
    puts "You chose #{answer_color}! Good luck!"
    spin_wheel

    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."

    if answer_color == 1 && (@ball_landed.values[0]) == "red"
      winning 
    elsif answer_color == 2 && (@ball_landed.values[0]) == "black"
      winning
    else
      losing
    end
  end

  def even_odd
    choices = [ "odd", "even"]
    puts "Which one are you choosing?"
    puts "1) Odd"
    puts "2) Even"
    answer_even_odd = gets.strip.to_i
    puts "You chose #{answer_even_odd}! Good luck!"
    spin_wheel

    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."

    ball_even_odd = @ball_landed.keys[0]

    if ball_even_odd % 2 != 0 && answer_even_odd == 1
      winning 
    elsif ball_even_odd % 2 == 0 && answer_even_odd == 2
      winning
    else
      losing
    end
  end

  def high_low
    low = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
    high = [19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36]
    puts "Which one are you choosing?"
    puts "1) Low: 1 through 18"
    puts "2) High: 19 through 36"
    answer_high_low = gets.strip.to_i

    spin_wheel
    puts "Ball landed on #{@ball_landed.keys[0]}, #{@ball_landed.values[0]}."
    

    if answer_high_low == 1 && low.include?(@ball_landed.keys[0])
      winning 
    elsif answer_high_low == 2 && high.include?(@ball_landed.keys[0])
      winning
    else
      losing
    end
  end

  def winning
    puts "You just won!! Woop Woop! $#{@amount} has been added to your wallet."
    @wallet += @amount 
    puts @wallet
    quit_or_not
  end

  def losing
    puts "I'm sorry! Maybe your luck will change."
    @wallet -= @amount 
    puts @wallet
    quit_or_not
  end

end 




