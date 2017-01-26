require 'pg'
require_relative '../db/sql_runner'

class ExchangeRequest

  attr_reader :requested_date, :amount, :from_currency, :to_currency

  def initialize(params)
    @requested_date = params['requested_date']
    @amount = params['amount'].to_i
    @from_currency = params['from_currency']
    @to_currency = params['to_currency']
  end

  def save
    sql = "INSERT INTO results
    (requested_date, from_currency, to_currency, amount) 
    VALUES ('#{@requested_date}', '#{@from_currency}', 
    '#{@to_currency}', #{@amount})"
    SqlRunner.run(sql)
  end

  def self.exchange_request
    sql = "SELECT * FROM results 
    ORDER BY id DESC"
    post_info = SqlRunner.run(sql).first
    result = ExchangeRequest.new(post_info)
    return result
  end

  def self.delete_all
    sql = "DELETE FROM results"
    SqlRunner.run(sql)
  end

end