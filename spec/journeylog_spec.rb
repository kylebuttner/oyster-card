require 'journeylog'

describe Journeylog do

  it 'has a log method' do
    expect(subject).to respond_to(:log)
  end

  it 'initializes with an empty history' do
    expect(subject.log).to be_empty
  end

end
