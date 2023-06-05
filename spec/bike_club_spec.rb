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


Additionally, use TDD to add the following functionality to the BikeClub class. A passing challenge will complete at least one of the following. We recommend completing more than one if you have time.

A BikeClub can tell us which Biker has logged the most rides.
A BikeClub can tell us which Biker has the best time for a given Ride.
A BikeClub can tell us which Bikers are eligible for a given Ride. A Biker is eligible for a Ride if the terrain is acceptable to them and the total distance does not exceed their max distance.
