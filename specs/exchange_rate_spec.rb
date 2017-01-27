require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/currency_rate'
require_relative '../models/exchange_rate'

class TestExchangeRate < MiniTest::Test

  def test_calculates_total
    assert_equal(15, ExchangeRate.exchange_total(10, 1.5))
    assert_equal(8, ExchangeRate.exchange_total(10, 0.8))
  end
  
end