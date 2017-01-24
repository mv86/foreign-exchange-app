require 'sinatra'
require 'sinatra/contrib/all'
require_relative './models/exchange_rate'
require_relative './helpers/select_populator.rb'

get '/' do
  @currencies = Select_populator
  erb(:home)
end