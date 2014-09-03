require 'sinatra'
require 'sinatra/reloader'

configure do
  enable :sessions
end

get '/' do
  session["number"] ||= rand(101)
  number = session["number"]
  erb :index, :locals => {:id => color_choice(number, params["guess"]), :message => check_message(number, params["guess"])}
end

def check_message(number, guess)
  if guess.nil?
    "Hello Welcome to number guesser enter a guess"
  elsif number > guess.to_i
    "Hey your guess is too low. Try again."
  elsif number < guess.to_i
    "Your guess was too high try again."
  else
    "You got it! Congratulations."
  end
end

def color_choice(number, guess)
  if guess.nil?
    "white"
  elsif number > guess.to_i
    "red"
  elsif number < guess.to_i
    "green"
  end
end