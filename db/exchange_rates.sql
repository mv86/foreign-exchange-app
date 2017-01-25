DROP TABLE daily_fx_rates;
DROP TABLE results;

CREATE TABLE daily_fx_rates (
  id SERIAL4 PRIMARY KEY,
  fx_date DATE,
  currency VARCHAR(255),
  rate DECIMAL(10, 5)
);

CREATE TABLE results (
  id SERIAL4 PRIMARY KEY,
  requested_date DATE,
  from_currency VARCHAR(255),
  to_currency VARCHAR(255),
  amount INT4
);

