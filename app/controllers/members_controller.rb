class MembersController < ApplicationController
  before_action :set_team
  include Resourceable

  def destroy
    @resource.destroy
    redirect_to team_members_path(@team), notice: "Deleted"
  end

  private
  def set_team
    @team = Team.find(params[:team_id])
  end
end
