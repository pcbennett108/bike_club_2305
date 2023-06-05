require './lib/ride'

RSpec.describe Ride do 
  before(:each) do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  it "exists" do
    expect(@ride1).to be_instance_of(Ride)
  end

  it "has attributes" do
    expect(@ride1.name).to eq("Walnut Creek Trail")
    expect(@ride1.distance).to eq(10.7)
    expect(@ride1.terrain).to eq(:hills)
  end

  it "can check if the route is a loop" do

  end
  
  it "can calculate distance based on route type" do
    expect(@ride1.loop?).to be false
    expect(@ride1.total_distance).to eq(21.4)
    expect(@ride2.loop?).to be true
    expect(@ride2.total_distance).to eq(14.9)
  end

end
