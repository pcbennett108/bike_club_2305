require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do 
  before(:each) do
    @club1 = BikeClub.new("Mountain Riders")
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  it "exists" do
    expect(@club1).to be_instance_of(BikeClub)
  end

  it "has attributes" do
    expect(@club1.name).to eq("Mountain Riders")
    expect(@club1.bikers).to eq([])
  end
  
  it "can add new bikers" do
    expect(@club1.bikers).to eq([])
    @club1.add_biker(@biker)
    @club1.add_biker(@biker2)
    expect(@club1.bikers).to eq([@biker, @biker2])
  end
  
  it "can return the biker with the most rides" do
    @club1.add_biker(@biker)
    @club1.add_biker(@biker2)
    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)
    @biker.log_ride(@ride1, 92.5)
    @biker.log_ride(@ride1, 91.1)
    @biker.log_ride(@ride2, 60.9)
    @biker.log_ride(@ride2, 61.6)
    @biker2.learn_terrain!(:gravel)
    @biker2.learn_terrain!(:hills)
    @biker2.log_ride(@ride2, 60.9)
    @biker2.log_ride(@ride2, 61.6)
    expect(@club1.most_rides).to eq(@biker)
  end

end

# could test a rider with no rides for edge case

#for testing log_time group ride
# expected_return = {
#   start_time: starting_time,
#   bikers: [fast_biker, @good_biker)
#   }
#   expect@bike_club.record_group_ride(@ride_1)).t
#   fast_end_time = Time. now - 600
#   @bike_club.end_group_ride(@ride_1, @fast_biker,
#   expect (@fast_biker.rides [eride_11).to eq| (50))
#   end