#$LOAD_PATH << '.'
#require 'passenger.rb'
#include Passenger
def create_passenger

  puts "What is your first name?"
  first_name = gets.chomp
  puts "What is your last name?"
  last_name = gets.chomp
  new_pass = Passenger.create(first_name: first_name, last_name: last_name)
  new_pass.add_flight
end
