class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :projects, dependent: :destroy
  has_many :investments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_projects, through: :likes, source: :project
  
  validates :nickname, presence: true, length: { maximum: 10 }

  def already_liked?(project)
    self.likes.exists?(project_id: project.id)
  end
end
