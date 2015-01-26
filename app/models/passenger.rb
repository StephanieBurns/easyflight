class Passenger < ActiveRecord::Base
	belongs_to :flight
  
  def add_flight
    @number_of_tries_to_validate ||= 0  
    all_flights = Flight.all
    destinations = []
    all_flights.each.with_index do |obj, index|
      destinations << all_flights[index].destination
    end
    puts "where do you want to go?"
    puts ""
    puts "Your choices include..."
    puts destinations
    @chosen_destination = gets.chomp
    @result = Flight.find_by_destination(@chosen_destination)
    if destination_valid
      puts "Enjoy your trip to #{@chosen_destination}"
      self.update_attribute :flight_id,@result.id
    else
      puts "That destination is not valid"
      @number_of_tries_to_validate += 1
      return "You're an idiot. You cannot fly with easy airlines." if @number_of_tries_to_validate > 2
      self.add_flight
    end
    #Passenger.first.update_attribute :flight_id,1
    

    # Pet.first.update_attribute :owner_id,1
    # Pet.first.owner

  end


  private
  def destination_valid
    puts ""
    puts ""
    puts ""

    if @result == nil
      false
    else
      true
    end
  end

end
