class User < ApplicationRecord
  has_many :recruitments, dependent: :destroy

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :lockable, :timeoutable, :trackable#, :omniauthable
end
