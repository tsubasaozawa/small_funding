class RemoveProjectIdFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :feedback, foreign_key: true
  end
end
