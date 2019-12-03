class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]
  before_action :set_project
  def new
    @feedback = Feedback.new
  end

  def create
    feedback = Feedback.create(feedback_params.merge(project_id: params[:project_id]))
    if feedback.save
      redirect_to project_feedback_path(params[:project_id],feedback.id)
    else
      render new_project_feedback_path
    end
  end

  def show
  end

  private

  def feedback_params
    params.permit(:text)
  end

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
