class FriendRelation < ApplicationRecord
  belongs_to :from_applicant, class_name: "User"
  belongs_to :to_target, class_name: "User"

  enum status: { "フレンド": 1, "申請中": 2, "ブロック": 3 }, _prefix: true

  def self.check_already_friend?(current_user, other_user)
    FriendRelation.exists?(from_applicant_id: current_user.id, to_target_id: other_user.id) || FriendRelation.exists?(from_applicant_id: other_user.id, to_target_id: current_user.id)
  end

  def self.get_friend_status(current_user, other_user)
    if FriendRelation.find_by(from_applicant_id: current_user.id, to_target_id: other_user.id).present?
      FriendRelation.find_by(from_applicant_id: current_user.id, to_target_id: other_user.id).status
    elsif FriendRelation.find_by(from_applicant_id: other_user.id, to_target_id: current_user.id).present?
      FriendRelation.find_by(from_applicant_id: other_user.id, to_target_id: current_user.id).status
    end
  end

  def self.pending_application?(current_user, other_user)
    FriendRelation.find_by(from_applicant_id: current_user.id, to_target_id: other_user.id).status == "申請中" || FriendRelation.find_by(from_applicant_id: other_user.id, to_target_id: current_user.id).status == "申請中"
  end

  def self.are_you_applicant?(current_user, other_user)
    FriendRelation.exists?(from_applicant_id: current_user.id, to_target_id: other_user.id)
  end

  def check_friend_status(current_user, other_user)
    FriendRelation.find_by(from_applicant_id: current_user.id, to_target_id: other_user.id).status == "フレンド" || FriendRelation.find_by(from_applicant_id: other_user.id, to_target_id: current_user.id).status == "フレンド"
  end


end
