require 'nokogiri'
require 'open-uri'

def parse_ecb_feed

  ecb_feed = Nokogiri::XML(open(
    "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))

  namespace = ["xmlns:http://www.ecb.int/vocabulary/2002-08-01/eurofxref", 
    "gesmes:http://www.gesmes.org/xml/2002-08-01"]

  return ecb_feed.xpath("//xmlns:Cube[@time]", namespace)

end