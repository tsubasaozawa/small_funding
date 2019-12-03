class Project < ApplicationRecord
  # mount_uploader :image, ImageUploader
  
  belongs_to :user
  has_many :investments, dependent: :destroy

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  has_many :project_categories, dependent: :destroy
  has_many :categories, through: :project_categories

  has_many :feedbacks

  validates :title,                presence: true, length: { maximum: 30 }
  validates :content,              presence: true
  validates :goal_amount,          presence: true,  numericality: { only_integer: true, greater_than: 0, less_than: 100000}
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if limit.present? && limit < Date.today
      errors.add(:limit, ": 過去の日付は使用できません")
    end
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
