require 'garage'

describe Garage do
  before {allow(bike).to receive(:fix!)}
  it_behaves_like "a bike container"
  let(:bike){double :bike, working?: false}
  let(:garage){Garage.new}

  it "fixes a bike once docked" do
    expect(bike).to receive(:fix!)
    garage.dock(bike)
  end

end