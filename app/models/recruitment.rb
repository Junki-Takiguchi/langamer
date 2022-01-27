class Recruitment < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 32}
  validates :content, presence: true, length: { maximum: 1000}
end
