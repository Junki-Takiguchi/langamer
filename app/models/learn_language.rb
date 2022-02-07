class LearnLanguage < ApplicationRecord
  belongs_to :user
  validates :learn_language, presence: true, uniqueness: { scope: :user_id }
  validates :rank, presence: true
  validates :learn_language_status, presence: true
  enum rank: { "初級者": 0, "中級者": 1, "上級者": 2, "ネイティブ": 3 }
  enum learn_language_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }
end
