require 'sinatra'
require 'sinatra/contrib/all'
require_relative './models/exchange_rate'
require_relative './models/exchange_request'
require_relative './models/currency_rate.rb'
require_relative './helpers/select_populator.rb'

get '/' do
  @currencies = Currency_select_populator
  @dates = CurrencyRate.available_fx_dates
  erb :home
end

post '/' do
  fx_request = ExchangeRequest.new(params)
  fx_request.save
  redirect to '/result'
end

get '/result' do
  @fx_request = ExchangeRequest.exchange_request
  @rate = ExchangeRate.at(@fx_request.requested_date, @fx_request.base_currency, 
    @fx_request.counter_currency)
  @result = ExchangeRate.exchange_total(@fx_request.amount, @rate)
  erb :result
end 