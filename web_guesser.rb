require 'sinatra'
require 'sinatra/reloader'

configure do
  enable :sessions
end

get '/' do
  session["number"] ||= rand(101)
  guess               = params["guess"]
  erb :index, :locals => {:message => check_message(session["number"], guess)}
end

def check_message(session_num, params)
  if params.nil?
    "Hello Welcome to number guesser enter a guess"
  elsif session_num > params.to_i
    "Hey your guess is too low. Try again."
  elsif session_num < params.to_i
    "Your guess was too high try again."
  else
    "You got it! Congratulations."
  end
end
