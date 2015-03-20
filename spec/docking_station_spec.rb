require 'docking_station'

describe DockingStation do
  it_behaves_like "a bike container"
  let(:old_street) { DockingStation.new }
  let(:bike){ double(:bike, {working?: true}) }
  let(:broken_bike){double(:broken_bike, {working?: false})}

  it "can have a default capacity" do
    expect(old_street.capacity).to eq 20
  end

  it "can have a custom capacity" do
    shorditch = DockingStation.new({capacity: 50})
    expect(shorditch.capacity).to eq 50
  end

  it "has no bikes when created" do
    expect(old_street).not_to have_bikes
  end

  it "raises an error when you're not docking a bike" do
    bike = "Bike"
    expect{ old_street.dock(bike) }.to raise_error "You can only dock a bike"
   end

  it "knows it has working bikes" do
    old_street.dock(broken_bike)
    old_street.dock(bike)
    expect(old_street.available_bikes).to eq [bike]
  end

  it "can release a bike" do
    old_street.dock bike
    old_street.release(bike)
    expect(old_street.available_bikes).to eq []
  end

end