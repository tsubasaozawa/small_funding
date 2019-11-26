class Project < ApplicationRecord
  belongs_to :user
  has_many :investments, dependent: :destroy

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
end
