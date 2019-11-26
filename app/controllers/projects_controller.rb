class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.create(project_params.merge(user_id: current_user.id))
    # project = Project.create(title: project_params[:title], content: project_params[:content], goal_amount: project_params[:goal_amount], limit: project_params[:limit], user_id: current_user.id)
    if project.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @total_amount = Investment.where(project_id: params[:id]).sum(:investment_amount)
    @like = Like.new
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
