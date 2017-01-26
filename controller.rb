require 'sinatra'
require 'sinatra/contrib/all'
require_relative './models/exchange_rate'
require_relative './models/exchange_request'
require_relative './models/currency.rb'
require_relative './helpers/select_populator.rb'

get '/' do
  @currencies = Currency_select_populator
  @dates = Currency.find_fx_dates
  # ExchangeRequest.delete_all
  erb :home
end

post '/' do
  fx_request = ExchangeRequest.new(params)
  fx_request.save
  redirect to '/result'
end

get '/result' do
  @fx_request = ExchangeRequest.exchange_request
  fx_rate = ExchangeRate.at(@fx_request.requested_date, @fx_request.from_currency, 
    @fx_request.to_currency)
  @result = ExchangeRate.exchange_total(@fx_request.amount, fx_rate)
  erb :result
end 