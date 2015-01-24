# First Attempt At Tic Tac Toe
require 'pry'

def create_space
  s = {}
  (1..9).each{|space| s[space] = ' '}
  s
end

def prompt(words)
  puts ">>> #{words}"
end

def human_choice(s)
  prompt "Pick a position (1-9): "
  choice = gets.chomp.to_i
  s[choice] = "X"
end

def is_space_empty(s)
  s.select{|k,v| v == ' '}.keys
end

def computer_choice(s)
  choice = is_space_empty(s).sample
  s[choice] = 'O'
end

def draw_board(s)
  system 'clear'
  prompt "\n"
  prompt " #{s[1]}  | #{s[2]}  | #{s[3]}"
  prompt "--------------"
  prompt " #{s[4]}  | #{s[5]}  | #{s[6]}"
  prompt "--------------"
  prompt " #{s[7]}  | #{s[8]}  | #{s[9]}"
  prompt "\n"
end

board = create_space


draw_board(board)

human_choice(board)

prompt draw_board(board)

computer_choice(board)

prompt draw_board(board)






