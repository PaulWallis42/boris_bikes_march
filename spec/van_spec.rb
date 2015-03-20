require 'van'

describe Van do

  it_behaves_like "a bike container"

  let(:van){Van.new}
  let(:broken_bike){double :broken_bike, working?: false}
  let(:bike){double :bike, working?: true}

  it "can have a default capacity" do
    expect(van.capacity).to eq 10
  end

  it "can have a custom capacity" do
    big_van = Van.new({capacity: 20})
    expect(big_van.capacity).to eq 20
  end

  it "can load a bike" do
    van.load broken_bike
    expect(van.bikes).to eq [broken_bike]
  end

  it "should be able to collect broken bikes from a station" do
    docking_station = double :docking_station, bikes: [bike, broken_bike]
    allow(docking_station).to receive(:release)
    van.collect_broken_bikes_from docking_station
    expect(van.bikes).to eq [broken_bike]
  end

  it "should be able to remove broken bikes from a station when collecting" do
    docking_station = double :docking_station, bikes: [bike, broken_bike]
    expect(docking_station).to receive(:release).with broken_bike
    van.collect_broken_bikes_from docking_station
  end

  it "should be able to drop of bikes to a garage" do
    van.load broken_bike
    garage = double :garage
    allow(garage).to receive(:dock).with broken_bike
    van.drop_off_bikes_to garage
    expect(van.bikes).to eq []
  end

  it "should remove bikes from self once dropped off" do
    van.load broken_bike
    garage = double :garage
    expect(garage).to receive(:dock).with broken_bike
    van.drop_off_bikes_to garage
  end



end