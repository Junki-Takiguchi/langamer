class Recruitment < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30}
  validates :email, presence: true, length: { maximum: 1000}
end
