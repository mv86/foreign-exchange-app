require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/exchange_request'

class TestExchangeRequest < MiniTest::Test

  def setup
    @exchange_request = ExchangeRequest.new({
      "requested_date" => "2007/11/01", 
      "amount" => 10,
      "from_currency" => "GBP", 
      "to_currency" => "JPY"
      })
  end

  def test_has_date
    assert_equal("2007/11/01", @exchange_request.requested_date)
  end

  def test_has_amount
    assert_equal(10, @exchange_request.amount)
  end

  def test_has_from_currency
    assert_equal("GBP", @exchange_request.from_currency)
  end 

  def test_has_to_currency
    assert_equal("JPY", @exchange_request.to_currency)
  end
  
end