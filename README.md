# Foreign Exchange App

A simple web app, written in Ruby, to obtain foreign exchange rates. 

## Dependencies

Gems: PG, Sinatra, Nokogiri

PostgreSQL - install instructions [here](https://www.postgresql.org/docs/9.6/static/tutorial-install.html)

## Instructions

Clone repository using `git clone https://github.com/mv86/foreign-exchange-app`

Create psql database using command `createdb exchange_rates` from terminal

Create database tables using `psql -d exchange_rates -f db/exchange_rates.sql` from root project folder

Add seed data using `ruby db/seeds.rb` from root project folder

Start server using `ruby controller.rb` from root project folder

Application will run on localhost:4567
