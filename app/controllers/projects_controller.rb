class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    if project.save
      redirect_to action: :show
    else
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :content, :goal_amount, :limit)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
