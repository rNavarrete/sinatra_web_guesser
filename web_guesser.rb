require 'sinatra'

configure do
  enable :sessions
end

get '/' do
  session["number"] ||= rand(101)
  "Your secret number is #{session["number"]}!!"
end

