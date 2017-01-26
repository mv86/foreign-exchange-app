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

  def self.find_fx_dates
    sql = "SELECT fx_date FROM daily_fx_rates WHERE 
    currency = 'EUR'"
    returned_dates = SqlRunner.run(sql)
    exchange_dates = []
    returned_dates.each { |date| exchange_dates.push(date) }
    return exchange_dates
  end

  def self.find_rate(date, currency)
    sql = "SELECT rate FROM daily_fx_rates WHERE 
    fx_date = '#{date}' AND currency = '#{currency}'"
    rate = SqlRunner.run(sql).first
    return rate['rate']
  end

  def self.delete_all
    sql = "DELETE FROM daily_fx_rates"
    SqlRunner.run(sql)
  end

end