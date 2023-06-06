require './lib/ride'
require './lib/biker'

class BikeClub
  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
  end

  # or you can add multiple bikers at once
  # def add_bikers (biker_array)
  #   @bikers.push(*biker_array)
  # end

  def most_rides
    @bikers.max_by { |biker| biker.number_of_rides }
    # what about case of a tie?
  end

end


# another way for most_rides,
# to get values straight from the rides Hash
# [1] pry(#<BikeClub>)> biker.rides.values
# => [[70, 65], [60]]
# [2] pry(#<BikeClub>)>

# def most_rides
#   @bikers.max_by do |biker|
#   biker.rides. values. flatten. count
# end
#*==============================================
# make use of .personal_record in Biker

# def best_time (ride)
#   @bikers.min_by do biker|
#     if !biker.rides.has_key? (ride)
#       Float::INFINITY
#     else
#       biker.personal_record(ride)
#     end
#   end
# end
#*==============================================

# def eligible_bikers(ride)
#   @bikers.find_all do |biker|
#     biker.acceptable_terrain.include?(ride.terrain) &&
#     biker.max_distance >= ride.total_distance
#   end
# end
#*==============================================

def record_group_ride(ride)
# find eligible riders
{
riders: eligible_bikers(ride),
start_time: log_time
}
# start the clock
# return value - start_time?, riders? HASH
end

def log_time
  Time.now
end

# a stub on a mocked object
# it "can record a group ride and add ride to biker
# @bike_club.add_bikers(I@fast_biker, @good_biker
# starting_time = Time. now - 3600
# allow(abike_club).to receive (: log_time) .and_return(starting_time)
# expected_return = {
# start_time: starting_time,
# bikers: [@fast_biker, @good_biker]
# }
# expect (@bike_club. record_group_ride(@ride_1)).t

# that hash might look like this
# @bike_club.add_bikers(l@fast_biker, @good_bi
# expected_return = {
# start_time: XX,
# bikers: [lagood_biker, @fast_bikerl]
# }

# expect@bike_club.record_group_ride(@ride_1)).to eq(expected_return)
# fast_end_time = Time.now - 600
# allow (@bike_club).to receive(: log_time).and_return(fast_end_time)
# @bike_club.end_group_ride(@ride_1, @fast_biker, expected_return[:start_tin
# expect (@fast DIKET.Pides (eride_11).to eq([50])
# end

def end_group_ride(ride, biker, start_time)
  # stop the time
  ride_end_time = log_time
  duration = (ride_end_time - start_time) / 60
  biker.log_ride(ride, duration.round)
  # calculate the time (end time - start time)
  # log the ride for individual biker
end