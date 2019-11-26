class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(project_id: params[:project_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(project_id: params[:project_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end