require 'sinatra'
require 'sinatra/contrib/all'
require_relative './models/exchange_rate'
require_relative './models/currency_converter.rb'
require_relative './helpers/select_populator.rb'

get '/' do
  @currencies = Currency_select_populator
  @result = ''
  erb :home
end

post '/' do
  
end