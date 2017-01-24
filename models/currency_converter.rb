class CurrencyConverter

  def self.converter(amount, currency1, currency2)
    sum = ((1 / currency1.to_f) * currency2.to_f) * amount
    return sum.round(2)
  end

end