require_relative '../models/exchange_rate'
require_relative '../helpers/xml_parser.rb'

ExchangeRate.delete_all

parse_ecb_feed.each do |day|

  day.children.each do |child|
    fx_item = ExchangeRate.new(day[:time], child[:currency], child[:rate])
    fx_item.save 
    
  end
end