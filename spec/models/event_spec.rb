require 'spec_helper'


describe Event do
  it "is valid with valid attributes" do
    expect(Event.new(
      name: "Let's play Tecmo Bowl!",
      description: "Fans of Tecmo Bowl, let's test our skills!",
      location: "Gordy's Gaming Emporium",
      creator: "touchdowntommy12"
      )).to be_valid
  end

  it "is not valid without a name" do
    meetup = Event.new(name: nil)
    expect(meetup).to_not be_valid
  end

  it "is not valid without a description" do
    meetup = Event.new(description: nil)
    expect(meetup).to_not be_valid
  end

  it "is not valid without a location" do
    meetup = Event.new(location: nil)
    expect(meetup).to_not be_valid
  end
end
