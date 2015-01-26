# First Attempt At Tic Tac Toe
require 'pry'

def create_space
  board = {}
  (1..9).each{|space| board[space] = ' '}
  board
end

def prompt(words)
  puts ">>> #{words}"
end

def human_choice(board)
  prompt "Pick a position (1-9): "
  choice = gets.chomp.to_i
  board[choice] = "X"
end

def is_space_empty(board)
  board.select{|k,v| v == ' '}.keys
end

def computer_choice(board)
  choice = is_space_empty(board).sample
  board[choice] = 'O'
end

def draw_board(s)
  system 'clear'
  prompt "\n"
  prompt " #{s[1]}  | #{s[2]} | #{s[3]}"
  prompt "--------------"
  prompt " #{s[4]}  | #{s[5]} | #{s[6]}"
  prompt "--------------"
  prompt " #{s[7]}  | #{s[8]} | #{s[9]}"
  prompt "\n"
end

def check_for_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "You Won!!" if board.values_at(*line).count('X') == 3
    return "Computer Won!!" if board.values_at(*line).count('O') == 3
  end
  nil
end

board = create_space
draw_board(board)

begin
  human_choice(board)
  computer_choice(board)
  draw_board(board)
  winner = check_for_winner(board)
end until winner || is_space_empty(board).empty?

if winner
  prompt winner
else
  prompt "It's a tie!"
end