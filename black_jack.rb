
# require_relative `wallet`

require "pry"
require "colorize"




def separator
  puts "~" * 100
  puts
end



def deal(player, dealer, decks)
  2.times do
    player.push(decks.delete(decks.sample))
      dealer.push(decks.delete(decks.sample))
    end
    display_cards(player)
  end
  
  def display_cards(hands)
    
    i = 0 
    puts "Players Cards"
    hands.each do |card|
      puts "  __________"
      puts " |          |"
      puts " |          | "
      puts " |#{hands[i]}       |"
      puts " |          |"
      puts " |__________|"
      i = i + 1
    end
  end
  
  def dealer_shows(dealers_hand, players_hand, running_total1, running_total2)
    puts `clear`
    
    player_final_score(running_total1, running_total2)
    display_cards(players_hand)
    puts
    puts
    puts "Dealers Cards"
    i = 0
    dealers_hand.each do |card|
      puts "  __________"
      puts " |          |"
      puts " |          |"
      puts " |#{dealers_hand[i]}       |"
      puts " |          |"
      puts " |__________|"
      i = i + 1
    end
  end
  
  def player_final_score(running_total1, running_total2)
    
    if running_total1 <= 21 && running_total2 <= 21 && running_total2 > running_total1
      return running_total2
    else
      return running_total1
    end
  end
  
  def say_score(hands, person)
    total1 = calculate_total(hands)[:total1]
    total2 = calculate_total(hands)[:total2]
    if total1 == 21 || total2 == 21
      puts 
    elsif total1 == total2
      puts "#{person} has #{total1}"
    elsif total1 <= 21 && total2 <= 21
      puts "#{person} has #{total1} or #{total2}"
    elsif total2 > 21
      puts  "#{person} has #{total1}"
    end
  end
  
  def calculate_total(array)
    running_total = {:total1 => 0, :total2 => 0 }
    ace_present = false 
    array.each do |card|
      if card.slice(0) == "A"
        if ace_present == true
          running_total[:total1] = running_total[:total1] + 1
          running_total[:total2] = running_total[:total2] + 1
        else ace_present == false
          running_total[:total1] = running_total[:total1] + 1
          running_total[:total2] = running_total[:total2] + 11
          ace_present = true
        end
      elsif card.slice(0) == "J" || card.slice(0) == "Q" || card.slice(0) == "K" || card.slice(0..1) == "10"
        running_total[:total1] = running_total[:total1] + 10
        running_total[:total2] = running_total[:total2] + 10
      else
        running_total[:total1] = running_total[:total1] + card.slice(0).to_i
        running_total[:total2] = running_total[:total2] + card.slice(0).to_i
      end
    end
    running_total
  end
  
  
  def player_hit_or_stay(running_total1, running_total2, decks, player, dealer)
    say_score(player, "Player")
    if running_total1 > 21 && running_total2 > 21 
      puts "YOU BUST!"
      puts "Dealer wins"
      sleep 1.5
      puts "GAME OVER :("
    elsif running_total1 == 21 || running_total2 == 21 
      puts "BLACKJACK!!!!"
      running_total1 = calculate_total(player)[:total1]
      running_total2 = calculate_total(player)[:total2]
      player_score = player_final_score(running_total1, running_total2)    
      running_total1 = calculate_total(dealer)[:total1]
      running_total2 = calculate_total(dealer)[:total2]
      dealer_score = player_final_score(running_total1, running_total2)
      puts say_score(dealer, "Dealer")
      sleep 1
      result(player_score, dealer_score)
    elsif running_total1 <= 20 || running_total2 <= 20
      puts 'Hit(h) or Stay(s)?'
      answer = gets.chomp.downcase
      while answer != 'h' && answer != 's'
        puts 'Press "h" to hit or press "s" to stay'
        answer = gets.chomp.downcase
      end
      if answer == 'h'
        sleep 1
        hit(decks, player)
        system 'clear'
        display_cards(player)
        running_total1 = calculate_total(player)[:total1]
        running_total2 = calculate_total(player)[:total2]
        player_hit_or_stay(running_total1, running_total2, decks, player, dealer)
      elsif answer == 's'
        dealer_shows(dealer, player, running_total1, running_total2)
        puts "You stayed on #{player_final_score(running_total1, running_total2)}"
        player_score = player_final_score(running_total1, running_total2)
        sleep 1
        running_total1 = calculate_total(dealer)[:total1]
        running_total2 = calculate_total(dealer)[:total2]
        puts say_score(dealer, "Dealer")
        sleep 1
        dealer_hit_or_stay(decks,running_total1,running_total2, player, dealer, player_score)
      end
    end
  end
  
  def dealer_hit_or_stay(decks, running_total1,running_total2, player, dealer, player_score)
    if running_total1 > 21 && running_total2 > 21 
      puts "Dealer BUST, You WIN!!!!!"
      sleep 0.5
      puts "Game Over :)"
    elsif running_total1 == 21 || running_total2 == 21
      puts 'DEALER HAS BLACKJACK!'
      running_total1 = calculate_total(dealer)[:total1]
      running_total2 = calculate_total(dealer)[:total2] 
      dealer_score = player_final_score(running_total1, running_total2)
      result(player_score, dealer_score)
    elsif running_total1 < 17 && running_total2 < 17
      puts 'Dealer Hits'
      hit(decks, dealer)
      sleep 2
      dealer_shows(dealer, player, running_total1, running_total2)
      puts "You stayed on #{player_score}"
      say_score(dealer, "Dealer")
      running_total1 = calculate_total(dealer)[:total1]
      running_total2 = calculate_total(dealer)[:total2] 
      dealer_hit_or_stay(decks, running_total1,running_total2, player, dealer, player_score)
    elsif running_total1 >= 17 && running_total1 <= 18
      gamble = ['yes', 'no']
      if gamble.sample == 'yes'
        puts 'Dealer Hits'
        hit(decks, dealer)
        sleep 2
        dealer_shows(dealer, player, running_total1, running_total2)
        running_total1 = calculate_total(dealer)[:total1]
        running_total2 = calculate_total(dealer)[:total2] 
        dealer_hit_or_stay(decks, running_total1,running_total2, player, dealer, player_score)
      elsif gamble.sample == 'no'
        puts 'Dealer Stays'
        sleep 2
        running_total1 = calculate_total(dealer)[:total1]
        running_total2 = calculate_total(dealer)[:total2] 
        dealer_score = player_final_score(running_total1, running_total2)
        result(player_score, dealer_score)
      end
      # if s result(player_score, dealer_score)
    elsif running_total1 >= 19 && running_total1 <= 20 || running_total2 >= 19 && running_total2 <= 20
      puts 'Dealer Stays!'
      running_total1 = calculate_total(dealer)[:total1]
      running_total2 = calculate_total(dealer)[:total2] 
      dealer_score = player_final_score(running_total1, running_total2)
      result(player_score, dealer_score)
    end
  end
  
  def hit(deck, hand)
    hand.push(deck.delete(deck.sample))
    calculate_total(hand)
  end
  
  # result calc
  def result(player_score, dealer_score)
    if player_score == dealer_score
      puts "Both player got #{player_score}"
      puts "It's a DRAW!"
    elsif player_score > dealer_score
      puts "#{player_score} beats #{dealer_score}"    
      puts "YOU WIN!!!"
    elsif dealer_score > player_score
      puts "#{dealer_score} beats #{player_score}"
      puts "Dealer wins :("
    end
  end
  
  # play again 
  play_again = 'y'
  game_streak = 0
  results = { :wins => 0, :losses => 0, :draws => 0 } # store history
  
  
  while play_again == 'y'
    # initialize decks
    decks = ['Ah ', '2h ', '3h ', '4h ', '5h ', '6h ', '7h ', '8h ', '9h ', '10h', 'Jh ', 'Qh ', 'Kh ','Ad ', '2d ', '3d ', '4d ', '5d ', '6d ', '7d ', '8d ', '9d ', '10d', 'Jd ', 'Qd ', 'Kd ', 'As ', '2s ', '3s ', '4s ', '5s ', '6s ', '7s ', '8s ', '9s ', '10s', 'Js ', 'Qs ', 'Ks ', 'Ac ', '2c ', '3c ', '4c ', '5c ', '6c ', '7c ', '8c ', '9c ', '10c', 'Jc ', 'Qc ', 'Kc ', 'Ah ', '2h ', '3h ', '4h ', '5h ', '6h ', '7h ', '8h ', '9h ', '10h', 'Jh ', 'Qh ', 'Kh ','Ad ', '2d ', '3d ', '4d ', '5d ', '6d ', '7d ', '8d ', '9d ', '10d', 'Jd ', 'Qd ', 'Kd ', 'As ', '2s ', '3s ', '4s ', '5s ', '6s ', '7s ', '8s ', '9s ', '10s', 'Js ', 'Qs ', 'Ks ', 'Ac ', '2c ', '3c ', '4c ', '5c ', '6c ', '7c ', '8c ', '9c ', '10c', 'Jc ', 'Qc ', 'Kc ']
    
    # empty arrays to hold all players cards
    player = []
    dealer = []   
    
    def place_bet()
      

      bet_options = [
        "Place Min. Bet",
        "Increase Bet",
        "Exit Game"]
        
        bet_options.each_with_index do |item, i|
          print "#{i + 1}: #{item} "
        end
        print "> ".colorize(:cyan)
        puts "Min Bet is $10"
        
        case gets.strip
        when "1"
          min_bet
          puts "Min. Bet Placed"
          
        when "2"
          increase_bet

        when "3"
          puts "Come back soon"
          puts "We will take your money any time"
          exit!
        else
          puts "Invalid input"
          place_bet
        end
      end
    
      def min_bet
        puts @wallet.first
        min_bet = 10 
        @money_bet << min_bet
      end
      
      def increase_bet
        puts @wallet.first
        puts "How much would you like to bet? ($10 Min.)"
        print "> "
        bet_increase = gets.to_i
        bet = @wallet[0].to_i
        if bet_increase <= bet && bet_increase != 0
          puts "Ok Big Baller! Lets Play!"
          @money_bet << bet_increase
        elsif bet_increase > @wallet
          puts "Sorry, you only have $@{@wallet}. Go get more money!"
          increase_bet
        else
          puts "Invalid Entry. Try Again"
          increase_bet
        end
      end 
      
      @money_bet = []
      @new_wallet_total = []
      @wallet = [500]

      # player_wins_losses_draws adding/subtracting from wallet?
       if results[:wins] >= 1
        bet = @money_bet[0].to_i
        @wallet.map { |item| item += bet }
       puts "#{@wallet}"
        # @new_wallet_total = @wallet + (@money_bet * 2)
        # @wallet.clear
        # @wallet << @new_wallet_total

        elsif results[:losses] >= 1
          @wallet.map { |item| item -= bet }
          puts "#{@wallet}"
        
          # @new_wallet_total = @wallet - @money_bet
          # @wallet.clear 

        @wallet << @new_wallet_total
       else results[:draws] >= 1
        puts "PUSH"
        #   @new_wallet_total = @money_bet + @wallet
        # @wallet << @new_wallet_total
        end
        


    separator
    print "                 Welcome to Casino Royale BlackJack"
    puts
    separator
    place_bet
    # Deal two card to each player
    deal(player, dealer, decks)
    
    # player takes turn
    total1 = calculate_total(player)[:total1] 
    total2 = calculate_total(player)[:total2] 
    player_hit_or_stay(total1,total2, decks, player, dealer)
    total1 = calculate_total(player)[:total1] 
    total2 = calculate_total(player)[:total2] 
    p = player_final_score(total1, total2)
    total1 = calculate_total(dealer)[:total1] 
    total2 = calculate_total(dealer)[:total2] 
    d = player_final_score(total1, total2)
    
    
    sleep 0.5
    case
    when d > 21
      results[:wins] = results[:wins] + 1
    when p <= 21 && p > d
      results[:wins] = results[:wins] + 1
    when p == d
      results[:draws] = results[:draws] + 1
    when d <= 21 && d > p
      results[:losses] = results[:losses] + 1
    else p > 21
      results[:losses] = results[:losses] + 1
    end
    
  game_streak = game_streak + 1
  per_wins = (results[:wins].to_f / game_streak.to_f * 100).round(2)
  puts "_____________________________________"
  puts "_____________________________________"
  puts "Current game streak is #{game_streak}"
  puts "You have won #{results[:wins]}, lost #{results[:losses]} and drawn #{results[:draws]}"
  puts "You have won #{per_wins}% of the games you have played"
  puts "_____________________________________"
  puts "_____________________________________"
  
  
  # play again?
  puts "Play again? (y/n)"
  play_again = gets.chomp
  
end





