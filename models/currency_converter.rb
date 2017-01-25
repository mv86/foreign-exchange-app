class CurrencyConverter

  def self.convert_currency(amount, currency1, currency2)
    sum = ((1 / currency1.to_f) * currency2.to_f) * amount.to_f
    return sum.round(2)
  end

end