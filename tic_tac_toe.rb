# First Attempt At Tic Tac Toe
require 'pry'

def make_board
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

def list_of_empty_spaces(board)
  board.select{|_,v| v == ' '}.keys
end

def computer_choice(board)
  choice = list_of_empty_spaces(board).sample
  board[choice] = 'O'
end

def draw_board(board)
  system 'clear'
  prompt "\n"
  prompt " #{board[1]}  | #{board[2]} | #{board[3]}"
  prompt "--------------"
  prompt " #{board[4]}  | #{board[5]} | #{board[6]}"
  prompt "--------------"
  prompt " #{board[7]}  | #{board[8]} | #{board[9]}"
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

board = make_board
draw_board(board)

begin
  human_choice(board)
  computer_choice(board)
  draw_board(board)
  winner = check_for_winner(board)
end until winner || list_of_empty_spaces(board).empty?

if winner
  prompt winner
else
  prompt "It's a tie!"
end