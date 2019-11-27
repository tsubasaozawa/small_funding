class Category < ApplicationRecord
  has_many :project_categories,    dependent: :destroy
  has_many :projects,              through: :project_categories
  validates :tag_name,          presence: true, uniqueness: true

#  # タグのバリデーションは後日実装
#   validate  :tag_list_tag_validation

#   def tag_list_tag_validation
#     tag_validation = tag_name
#     tag_validation.split(",")
#     if tag_validation.length < 1
#       errors.add(:tag_list, "タグを入力してください")
#     end
#     if tag_validation.length < 2
#       errors.add(:tag_list, "タグは２個以上入力してください")
#     end
#     if tag_validation.length > 5
#       errors.add(:tag_list, "タグは５個までです")
#     end
#   end
end