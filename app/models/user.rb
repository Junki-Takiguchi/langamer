class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :lockable, :timeoutable, :trackable #, :omniauthable

  has_many :game_relations, dependent: :destroy
  has_many :recruitments, dependent: :destroy
  has_one :user_detail, dependent: :destroy
  has_one :game_account, dependent: :destroy

  has_many :friend_relations, foreign_key: 'from_applicant_id', dependent: :destroy
  has_many :reverse_of_relations, foreign_key: 'to_target_id', class_name: 'FriendRelation', dependent: :destroy
# has_many 変数 / どこのテーブルを仲介するか / 何の情報を取ってくるか
  has_many :applicant, through: :friend_relations, source: :to_target
  has_many :reverse_of_target, through: :reverse_of_relations, source: :from_applicant

end
