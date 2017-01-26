require 'sinatra'
require 'sinatra/contrib/all'
require_relative './models/exchange_rate'
require_relative './models/exchange_request'
require_relative './models/currency_converter.rb'
require_relative './helpers/select_populator.rb'

get '/' do
  @currencies = Currency_select_populator
  @dates = ExchangeRate.find_fx_dates
  ExchangeRequest.delete_all
  erb :home
end

post '/' do
  fx_request = ExchangeRequest.new(params)
  fx_request.save
  redirect to '/result'
end

get '/result' do
  @fx_request = ExchangeRequest.exchange_request

  from_currency_rate = ExchangeRate.find_rate(@fx_request.requested_date, 
    @fx_request.from_currency)

  to_currency_rate = ExchangeRate.find_rate(@fx_request.requested_date, 
    @fx_request.to_currency)

  @result = CurrencyConverter.convert_currency(@fx_request.amount, 
    from_currency_rate, to_currency_rate)

  erb :result
end 