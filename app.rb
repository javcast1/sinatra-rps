require 'sinatra'
require "sinatra/reloader"

get("/") do
  <<~HTML
      <ul>
      <li><a href="/play/rock">Play Rock</a></li>
      <li><a href="/play/paper">Paper</a></li>
      <li><a href="/play/scissors">Scissors</a></li>
      
    <h1>Welcome to Rock, Paper, Scissors!</h1>
    
  HTML
end

get("/play/:choice") do
  choice = params["choice"]

  # Generate a random computer choice
  computer_choice = ["rock", "paper", "scissors"].sample

  # Determine the game result
  result = play_game(choice, computer_choice)

  <<~HTML
    <h1>You chose #{choice.capitalize}</h1>
    <p>The computer chose #{computer_choice.capitalize}</p>
    <h2>Result: #{result}</h2>
    <p><a href="/">Play Again</a></p>
  HTML
end

def play_game(player_choice, computer_choice)
  if player_choice == computer_choice
    "It's a draw!"
  elsif (player_choice == "rock" && computer_choice == "scissors") ||
        (player_choice == "paper" && computer_choice == "rock") ||
        (player_choice == "scissors" && computer_choice == "paper")
    "You win!"
  else
    "You lose!"
  end
end
