class User < ApplicationRecord
  has_many :game_relations, dependent: :destroy
  has_many :recruitments, dependent: :destroy
  has_one :user_detail, dependent: :destroy
  has_one :game_account, dependent: :destroy
  has_many :from_applicant_user, foreign_key: 'from_applicant', class_name: 'FriendRelation', dependent: :destroy
  has_many :to_target_user, foreign_key: 'to_target', class_name: 'FriendRelation', dependent: :destroy
  has_many :my_friend, through: :from_applicant_user, source: :to_target
  has_many :friend, through: :to_target_user, source: :from_applicant

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :lockable, :timeoutable, :trackable #, :omniauthable
end
