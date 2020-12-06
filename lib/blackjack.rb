require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp.downcase
end

# def get_user_input
#   prompt_user
#   gets.chomp.downcase
# end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_total = deal_card + deal_card
  display_card_total(card_total)
  card_total
end


def hit?(card_total)
  prompt_user
  user_input = get_user_input 
  while user_input != 'h' && user_input != 's' do
    invalid_command
    prompt_user
    user_input = get_user_input
  end
  if user_input == 'h'
    card_total += deal_card
  else
    card_total
  end
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

# def runner
#   welcome
#   card_total = hit?(initial_round)
#   while card_total <= 21 do
#     hit?(card_total)
#   end
#   end_game(card_total)
# end

def runner
  welcome
  card_total = initial_round
  card_total = hit?(initial_round)
  display_card_total(card_total)
  while card_total <= 21 do
    hit?(card_total)
    display_card_total(card_total)
  end
  end_game(card_total)
end