class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @cycle = Cycle.find(params[:cycle_id])
    respond_to do |f|
      f.js
      f.html
    end
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.cycle = Cycle.find(params[:cycle_id])
    if @invitation.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def invitation_params
    params.require(:invitation).permit(:email, :message)
  end
end
