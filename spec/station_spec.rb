require 'station'

describe Station do
  subject(:station) { described_class.new('aldgate', 2) }

  it 'initializes with name' do
    expect(station.name).to eq 'aldgate'
  end

  it 'initializes with zone' do
    expect(station.zone).to eq 2
  end
end
