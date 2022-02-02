class UserDetail < ApplicationRecord
  belongs_to :user

  validates :account_name, presence: true, length: { maximum: 16}
  validates :profile_picture, length: { maximum: 255}
  validates :self_introduction, length: { maximum: 1000}
  validates :learn_language, presence: true, length: { maximum: 64}
  validates :first_language, presence: true, length: { maximum: 64}
  validates :second_language, length: { maximum: 64}
  validates :living_country, length: { maximum: 64}
  validates :native_country, length: { maximum: 64}

  enum gender: { "男性": 0, "女性": 1, "その他": 2 }

end
