class Project < ApplicationRecord
  belongs_to :user
  has_many :investments, dependent: :destroy

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  has_many :project_categories, dependent: :destroy
  has_many :categories, through: :project_categories

  validates :title,                presence: true
  validates :content,              presence: true
  validates :goal_amount,          presence: true,  numericality: { only_integer: true, greater_than: 0, less_than: 100000}
  validates :limit,                presence: true

  # タグのバリデーションは後日実装
  # validate  :tag_list_tag_validation

  #  def tag_list_tag_validation
  #    tag_validation = tag_name #validatesの時と違って、:tag_listとしないところを注意
  #    tag_validation.split(",")
  #    if tag_validation.length < 1
  #      errors.add(:tag_list, "タグを入力してください")
  #    end
  #    if tag_validation.length < 2
  #      errors.add(:tag_list, "タグは２個以上入力してください")
  #    end
  #    if tag_validation.length >5
  #      errors.add(:tag_list, "タグは５個までです")
  #    end
  #  end
  

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
