require 'pg'
require_relative '../db/sql_runner'

class ExchangeRate

  attr_reader :date, :currency, :rate

  def initialize(date, currency, rate)
    @date = date
    @currency = currency
    @rate = rate
  end

  def save
    sql = "INSERT INTO daily_fx_rates
    (fx_date, currency, rate) VALUES
    ('#{@date}', '#{@currency}', '#{@rate}')"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM daily_fx_rates"
    SqlRunner.run(sql)
  end

end