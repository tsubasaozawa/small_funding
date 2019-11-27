class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.includes(:categories)
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.create(project_params.merge(user_id: current_user.id))
    category_list = params[:category_list].split(",")
    if project.save
      project.save_categories(category_list)
      redirect_to root_path
    else
      redirect_to new_project_path
    end
  end

  def show
    today = Date.today
    @remaining_days = (@project.limit - today).to_i
    @total_amount = Investment.where(project_id: params[:id]).sum(:investment_amount)
    @like = Like.new
  end

  def edit
    @category_list = @project.categories.pluck(:tag_name).join(",")
  end

  def update
    category_list = params[:category_list].split(",")
    if @project.update(project_params)
      @project.save_categories(category_list)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :content, :goal_amount, :limit, :category_list)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_today
    @proje = Project.find(params[:id])
  end
end
