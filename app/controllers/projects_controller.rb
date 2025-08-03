class ProjectsController < ApplicationController
  def index
    @projects = Project.order(released_on: :desc).limit(10)
  end

  def show
  end
end
