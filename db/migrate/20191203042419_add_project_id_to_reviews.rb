class AddProjectIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :project
  end
end
