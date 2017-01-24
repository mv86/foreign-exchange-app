require 'sinatra'
require 'sinatra/contrib/all'
require_relative './models/exchange_rate'

get '/' do
  erb(:home)
end