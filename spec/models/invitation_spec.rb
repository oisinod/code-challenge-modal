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
end
