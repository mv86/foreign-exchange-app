require 'sinatra'
require 'sinatra/contrib/all'
require_relative './models/exchange_rate'
require_relative './models/currency_converter.rb'
require_relative './helpers/select_populator.rb'

get '/' do
  @currencies = Select_populator
  @result = ''
  erb :home
end

# post '/' do
#   @from_currency_rate = ExchangeRate.find_rate(params[:calender], 
#     params[:from_currency])
#   @to_currency_rate = ExchangeRate.find_rate(params[:calender], 
#     params[:to_currency])
#   @result = CurrencyConverter.convert_currency(params[:amount], 
#     @from_currency_rate, @to_currency_rate)
#   redirect to :'/'
# end