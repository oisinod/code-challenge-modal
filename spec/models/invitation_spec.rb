require 'rails_helper'

RSpec.describe Invitation, type: :model do
  cycle = Cycle.create(
    { name: 'Inkjet printer', public_status: true },
  )

  it "is valid with valid attributes" do
    invitation = Invitation.new(email: "test@1234.com", message: "test message")
    invitation.cycle = cycle
    expect(invitation).to be_valid
  end
  it "is not valid without an email" do
    invitation = Invitation.new(email: nil)
    expect(invitation).to_not be_valid
  end
  it "is not valid with an invalid email" do
    invitation = Invitation.new(email: "blahbahblah")
    expect(invitation).to_not be_valid
  end

  it "may have no message" do
    invitation = Invitation.new(email: "test@1234.com")
    invitation.cycle = cycle
    expect(invitation).to be_valid
  end

  it "should return a username if none is provided and the email is given with a '.' " do
    invitation = Invitation.new(email: "test.username@1234.com")
    invitation.cycle = cycle
    invitation.save
    expect(invitation.name).to eq("Test Username")
  end

  it "should return a username if none is provided and the email is given with a '.' " do
    invitation = Invitation.new(email: "test.username@1234.com")
    invitation.cycle = cycle
    invitation.save
    expect(invitation.name).to eq("Test Username")
  end

  it "takes an email from a format given by the email client" do
    invitation = Invitation.new(email: "Display name <email.username@doma.in>")
    invitation.cycle = cycle
    invitation.save
    expect(invitation.email).to eq("email.username@doma.in")
  end
end
