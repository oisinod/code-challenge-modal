class CyclesController < ApplicationController
  def index
    @invitation = Invitation.new
    @cycles = Cycle.where(public_status: true)
  end
end
