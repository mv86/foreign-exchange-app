require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/currency'

class TestCurrency < MiniTest::Test

  def setup
    @currency = Currency.new("2007/11/01", "GBP", 0.9987)
  end

  def test_has_date
    assert_equal("2007/11/01", @currency.date)
  end

  def test_has_currency
    assert_equal("GBP", @currency.currency)
  end

  def test_has_rate
    assert_equal(0.9987, @currency.rate)
  end
  
end