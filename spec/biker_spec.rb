require './lib/ride'
require './lib/biker'

RSpec.describe Biker do 
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  it "exists" do
    expect(@biker).to be_instance_of(Biker)
  end

  it "has attributes" do
    expect(@biker.name).to eq("Kenny")
    expect(@biker.max_distance).to eq(30)
    expect(@biker.rides).to eq({})
    expect(@biker.acceptable_terrain).to eq([])
  end
  
  it "can learn new terrain" do
    expect(@biker.acceptable_terrain).to eq([])
    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)
    expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
  end
  
  it "can keep a record of rides and their times" do
    expect(@biker.rides).to eq({})
    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)
    @biker.log_ride(@ride1, 92.5)
    @biker.log_ride(@ride1, 91.1)
    @biker.log_ride(@ride2, 60.9)
    @biker.log_ride(@ride2, 61.6)
    expect(@biker.rides).to eq({@ride1 => [92.5, 91.1], @ride2 => [60.9, 61.6]})
  end
  
  it "can determin a personal record for each ride" do
    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)
    @biker.log_ride(@ride1, 92.5)
    @biker.log_ride(@ride1, 91.1)
    @biker.log_ride(@ride2, 60.9)
    @biker.log_ride(@ride2, 61.6)
    expect(@biker.personal_record(@ride1)).to eq(91.1)
    expect(@biker.personal_record(@ride2)).to eq(60.9)
  end
  
  it "can only ride on learned terrain" do
    expect(@biker.acceptable_terrain).to eq([])
    @biker2.log_ride(@ride1, 97.0)
    @biker2.log_ride(@ride2, 67.0)
    expect(@biker.rides).to eq({})
  end
  
  it "can only log rides within max_distance" do
    expect(@biker2.max_distance).to eq(15)
    @biker2.learn_terrain!(:gravel)
    @biker2.learn_terrain!(:hills)
    @biker2.log_ride(@ride1, 95.0)
    @biker2.log_ride(@ride2, 65.0)
    expect(@biker2.rides).to eq({@ride2 => [65.0]})
  end

  it "can only determin a personal record for qualifing rides" do
    @biker2.learn_terrain!(:gravel)
    @biker2.log_ride(@ride1, 95.0)
    @biker2.log_ride(@ride2, 65.2)
    @biker2.log_ride(@ride2, 65.0)
    @biker2.log_ride(@ride2, 66.4)
    expect(@biker2.personal_record(@ride2)).to eq(65.0)
    expect(@biker2.personal_record(@ride1)).to be false
  end
  
end
