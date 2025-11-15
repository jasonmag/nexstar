# app/controllers/admin/projects_controller.rb
module Admin
  class ProjectsController < Admin::BaseController
    before_action :set_project, only: [:edit, :update, :destroy]

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
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @project.update(project_params)
        redirect_to admin_projects_path, notice: "Project updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @project.destroy
      redirect_to admin_projects_path, notice: "Project deleted."
    end

    private

    def set_project
      # Numeric fallback (in case of old data)
      if params[:id].to_s.match?(/\A\d+\z/)
        @project = Project.find(params[:id])
      else
        @project = Project.find_by!(slug: params[:id])
      end
    end

    def project_params
      params.require(:project).permit(
        :name,
        :description,
        :tech_stack,
        :url,
        :github_url,
        :released_on,
        :image_url,
        :slug
      )
    end
  end
end
