class ExchangeRate

  def self.at(date, base_currency, counter_currency)
    base_currency_rate = find_rate(date, base_currency)
    counter_currency_rate = find_rate(date, counter_currency)
    return ((1 / base_currency_rate.to_f) * counter_currency_rate.to_f)
  end

  def self.find_rate(date, currency)
    sql = "SELECT rate FROM daily_fx_rates WHERE 
    fx_date = '#{date}' AND currency = '#{currency}'"
    rate = SqlRunner.run(sql).first
    return rate['rate']
  end

  def self.exchange_total(amount, rate)
    return amount * rate
  end

end