DROP TABLE daily_fx_rates;
DROP TABLE fx_requests;

CREATE TABLE daily_fx_rates (
  id SERIAL4 PRIMARY KEY,
  fx_date VARCHAR(255),
  currency VARCHAR(255),
  rate DECIMAL(10, 5)
);

CREATE TABLE fx_requests (
  id SERIAL4 PRIMARY KEY,
  requested_date VARCHAR(255),
  amount INT4,
  base_currency VARCHAR(255),
  counter_currency VARCHAR(255)
);

