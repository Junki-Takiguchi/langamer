class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable, :lockable, :timeoutable, :trackable #, :omniauthable

  has_one :user_detail, dependent: :destroy
  accepts_nested_attributes_for :user_detail, allow_destroy: true
  has_one :game_account, dependent: :destroy
  accepts_nested_attributes_for :game_account, allow_destroy: true

  has_many :games, dependent: :destroy
  accepts_nested_attributes_for :games, allow_destroy: true
  has_many :learn_languages, dependent: :destroy
  accepts_nested_attributes_for :learn_languages, allow_destroy: true
  has_many :speak_languages, dependent: :destroy
  accepts_nested_attributes_for :speak_languages, allow_destroy: true

  has_many :recruitments, dependent: :destroy

  has_many :friend_relations, foreign_key: 'from_applicant_id', dependent: :destroy
  has_many :reverse_of_relations, foreign_key: 'to_target_id', class_name: 'FriendRelation', dependent: :destroy
  has_many :applicant, through: :friend_relations, source: :to_target
  has_many :reverse_of_target, through: :reverse_of_relations, source: :from_applicant


  def send_friend_request!(other_user)
    friend_relations.create!(to_target_id: other_user.id, status: 2)
  end

  def check_already_friend?(other_user)
    friend_relations.find_by(to_target_id: other_user.id)
  end

  def update_friend_status!(other_user)
    friend_relations.find_by(to_target_id: other_user.id).update!(status: 3)
  end

  def delete_friend!(other_user)
    friend_relations.find_by(to_target_id: other_user.id).destroy
  end

  def release_info(current_user, user, column, status)
    if current_user.id == user.id || (column.present? && (status == "公開" || (FriendRelation.get_friend_status(current_user, user) == "フレンド" && status == "フレンドのみ公開")))
      return true
    end
  end

end
