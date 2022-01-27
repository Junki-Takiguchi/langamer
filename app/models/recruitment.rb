class Recruitment < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 32}
  validates :email, presence: true, length: { maximum: 1000}
end
