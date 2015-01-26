#$LOAD_PATH << '.'
#require 'passenger.rb'
#include Passenger
def create_passenger
  puts "Welcome to Easy Airlines. If it were any easier it'd be Your Mom Airlines."
  puts "We take motorboating your mom to new heights."
  puts "... oh that's a little awkward..."
  puts ""
  puts "What is your first name?"
  first_name = gets.chomp
  puts "What is your last name?"
  last_name = gets.chomp
  new_pass = Passenger.create(first_name: first_name, last_name: last_name)
  new_pass.add_flight(random_insult)
end

def passengers

end

def check_in
  puts "With what method would you like to checkin?"
  puts ""
  puts "Name"
  puts "or"
  puts "Flight number"
  puts ""
  checkin_method = gets.chomp
  if checkin_method == "Name" or checkin_method == "name"
    puts "What is your first name?"
    first_name = gets.chomp
    puts "What is your last name?"
    last_name = gets.chomp
    pass = Passenger.where("first_name = ? AND last_name = ?", first_name, last_name).first
  else
    puts "What is your Flight number?"
    flight_number = gets.chomp
    pass = Passenger.find(flight_number)
  end
  if validate_pass(pass)
    puts ""
    puts ""
    "You've successfully checked in for your flight to #{Flight.find(pass.flight_id).destination}"
  else
    "We didn't find you. Suck a large one."
  end
end

  def random_insult

    insults = ["Suck a large one", "You derp", "You shit", "We can't help your stupidness", "Things programmers with the could say: You're a fucking idiot"]
    index = rand(0...insults.length)
    insults[index]
  end
private
  def validate_pass(pass)
    if pass == nil
      false
    else
      true
    end
end