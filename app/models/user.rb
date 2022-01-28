class User < ApplicationRecord
  has_many :game_relations, dependent: :destroy
  has_many :recruitments, dependent: :destroy
  has_one :user_detail, dependent: :destroy
  has_one :game_account, dependent: :destroy

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :lockable, :timeoutable, :trackable #, :omniauthable
end
