require 'sinatra'
require "sinatra/reloader"

get("/rock") do
  play_game("rock")
end

get("/paper") do
  play_game("paper")
end

get("/scissors") do
  play_game("scissors")
end

get("/rules") do
  <<~HTML
    <h1><a href="/rules">Rules</a></h1>
  HTML
end

get("/") do
  <<~HTML
    <h1>Welcome to Rock-Paper-Scissors!</h1>
    <p>From Wikipedia:</p>
    <p>Rock-paper-scissors (also known as paper, scissors, stone or other variants) is a hand game usually played between two people, in which each player simultaneously forms one of three shapes with an outstretched hand.</p>
    <p>These shapes are:</p>
    <ul>
      <li>"rock" (a closed fist)</li>
      <li>"paper" (a flat hand)</li>
      <li>"scissors" (a fist with the index and middle fingers extended, forming a V)</li>
    </ul>
    <p>A player who decides to play rock will beat another player who has chosen scissors ("rock crushes scissors" or sometimes "blunts scissors"), but will lose to one who has played paper ("paper covers rock"); a play of paper will lose to a play of scissors ("scissors cut[s] paper"). If both players choose the same shape, the game is tied and is usually immediately replayed to break the tie.</p>
    <table>
      <tr>
        <th>If we play...</th>
        <th>Rock</th>
        <th>Paper</th>
        <th>Scissors</th>
      </tr>
      <tr>
        <th>Rock</th>
        <td>We tie</td>
        <td>We lose</td>
        <td>We win</td>
      </tr>
      <tr>
        <th>Paper</th>
        <td>We win</td>
        <td>We tie</td>
        <td>We lose</td>
      </tr>
      <tr>
        <th>Scissors</th>
        <td>We lose</td>
        <td>We win</td>
        <td>We tie</td>
      </tr>
    </table>
    <p>Originating from China and Japan, other names for the game in the English-speaking world include roshambo and other orderings of the three items, with "rock" sometimes being called "stone".</p>
    <h2>Play Rock-Paper-Scissors:</h2>
    <ul>
      <li><a href="/rock">Play Rock</a></li>
      <li><a href="/paper">Play Paper</a></li>
      <li><a href="/scissors">Play Scissors</a></li>
    </ul>
  HTML
end

def play_game(player_choice)
  computer_choice = ["rock", "paper", "scissors"].sample

  result = determine_result(player_choice, computer_choice)

  <<~HTML
    <h1>You chose #{player_choice.capitalize}</h1>
    <p>The computer chose #{computer_choice.capitalize}</p>
    <h2>Result: #{result}</h2>
    <p><a href="/">Play Again</a></p>
  HTML
end

def determine_result(player_choice, computer_choice)
  if player_choice == computer_choice
    "It's a tie!"
  elsif (player_choice == "rock" && computer_choice == "scissors") ||
        (player_choice == "paper" && computer_choice == "rock") ||
        (player_choice == "scissors" && computer_choice == "paper")
    "You win!"
  else
    "You lose!"
  end
end
