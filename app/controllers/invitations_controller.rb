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
    respond_to do |f|
      if @invitation.save
        redirect_to root_path, notice: 'Your invitation has been created successfully'
      else
        f.js { render :new, notice: 'Invitation has not been created' }
      end
    end
  end


  private

  def invitation_params
    params.require(:invitation).permit(:email, :message)
  end
end
