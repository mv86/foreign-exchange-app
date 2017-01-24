class ExchangeRate

  attr_reader :date, :currency, :rate

  def initialize(date, currency, rate)
    @date = date
    @currency = currency
    @rate = rate
  end
  
end