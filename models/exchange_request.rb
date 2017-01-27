require 'pg'
require_relative '../db/sql_runner'

class ExchangeRequest

  attr_reader :requested_date, :amount, :base_currency, :counter_currency

  def initialize(params)
    @requested_date = params['requested_date']
    @amount = params['amount'].to_i
    @base_currency = params['base_currency']
    @counter_currency = params['counter_currency']
  end

  def save
    sql = "INSERT INTO fx_requests
    (requested_date, amount, base_currency, counter_currency) 
    VALUES ('#{@requested_date}', #{@amount}, '#{@base_currency}', 
    '#{@counter_currency}')"
    SqlRunner.run(sql)
  end

  def self.exchange_request
    sql = "SELECT * FROM fx_requests 
    ORDER BY id DESC"
    post_info = SqlRunner.run(sql).first
    result = ExchangeRequest.new(post_info)
    return result
  end

  def self.delete_all
    sql = "DELETE FROM fx_requests"
    SqlRunner.run(sql)
  end

end