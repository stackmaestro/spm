class ProjectsController < ApplicationController
  include Resourceable


  def index
    @resources = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @members = @project.members
  end

  def members
    @project = Project.find(params[:id])
  end
end
