require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/exchange_rate'

class TestExchangeRate < MiniTest::Test

  def setup
    @exchange_rate = ExchangeRate.new("2007/11/01", "GBP", 0.9987)
  end

  def test_has_date
    assert_equal("2007/11/01", @exchange_rate.date)
  end

  def test_has_currency
    assert_equal("GBP", @exchange_rate.currency)
  end

  def test_has_rate
    assert_equal(0.9987, @exchange_rate.rate)
  end
  
end