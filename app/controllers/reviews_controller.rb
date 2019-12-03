class ReviewsController < ApplicationController
  before_action :set_project

  def new
    @review = Review.new
  end
  def create
    review = Review.create(review_params.merge(project_id: params[:project_id], user_id: current_user.id))
    if review.save
      redirect_to project_review_path(params[:project_id],review.id)
    else
      render :new
    end
  end

  def show
  end

  private

  def review_params
    params.permit(:rate, :review)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

end
