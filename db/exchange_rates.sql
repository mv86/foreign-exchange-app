DROP TABLE daily_fx_rates;

CREATE TABLE daily_fx_rates (
  id SERIAL4 PRIMARY KEY,
  fx_date DATE,
  currency VARCHAR(255),
  rate DECIMAL(10, 5)
);