class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_image, ImageUploader

  has_many :projects, dependent: :destroy
  has_many :investments, dependent: :destroy

  has_many :reviews, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_projects, through: :likes, source: :project

  has_many :user_categories, dependent: :destroy
  has_many :categories, through: :user_categories
  
  validates :nickname, presence: true, length: { maximum: 10 }

  def already_liked?(project)
    self.likes.exists?(project_id: project.id)
  end

  def save_categories(tags)
    current_tags = self.categories.pluck(:tag_name) unless self.categories.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      self.categories.delete Category.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      post_category = Category.find_or_create_by(tag_name: new_name)
      self.categories << post_category
    end
  end
end
