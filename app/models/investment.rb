class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :investment_amount,              presence: true,  numericality: { only_integer: true, greater_than: 1000, less_than: 50000}
end
