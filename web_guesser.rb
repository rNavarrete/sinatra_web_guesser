require 'sinatra'
require 'sinatra/reloader'

configure do
  enable :sessions
end

get '/' do
  session["number"] ||= rand(101)
  erb :index #, :locals => {(session["number"]).to_sym => number}
end

