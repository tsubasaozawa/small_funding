class Project < ApplicationRecord
  belongs_to :user
  has_many :investments, dependent: :destroy

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  has_many :project_categories, dependent: :destroy
  has_many :categories, through: :project_categories

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
