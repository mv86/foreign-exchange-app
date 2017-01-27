require_relative '../models/currency_rate'
require_relative '../helpers/xml_parser.rb'

CurrencyRate.delete_all

parse_ecb_feed.each do |day|

  eur = CurrencyRate.new(day[:time], "EUR", 1)
  eur.save

  day.children.each do |child|
    fx_item = CurrencyRate.new(day[:time], child[:currency], child[:rate])
    fx_item.save 
    
  end
  
end