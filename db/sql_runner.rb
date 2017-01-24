class SqlRunner

  def self.run(sql)
    begin
      db = PG.connect({ dbname: 'exchange_rates', host: 'localhost' })
      result = db.exec(sql)
    ensure
      db.close() if db != nil
    end
    return result
  end
  
end