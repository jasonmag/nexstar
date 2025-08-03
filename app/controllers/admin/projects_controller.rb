# app/controllers/admin/projects_controller.rb
module Admin
  class ProjectsController < Admin::BaseController
    def index
      @projects = Project.order(released_on: :desc)
    end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        redirect_to admin_projects_path, notice: "Project created."
      else
        render :new
      end
    end

    def edit
      @project = Project.find(params[:id])
    end

    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to admin_projects_path, notice: "Project updated."
      else
        render :edit
      end
    end

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to admin_projects_path, notice: "Project deleted."
    end

    private

    def project_params
      params.require(:project).permit(:name, :description, :tech_stack, :url, :github_url, :released_on)
    end
  end
end
