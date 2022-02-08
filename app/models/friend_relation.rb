class FriendRelation < ApplicationRecord
  belongs_to :from_applicant, class_name: "User"
  belongs_to :to_target, class_name: "User"

  enum status: { "フレンド": 1, "申請中": 2, "ブロック": 3 }, _prefix: true

  def self.check_already_friend?(current_user, other_user)
    FriendRelation.exists?(from_applicant_id: current_user.id, to_target_id: other_user.id) || FriendRelation.exists?(from_applicant_id: other_user.id, to_target_id: current_user.id)
  end

  def self.get_friend_status(current_user, other_user)
    applicant = FriendRelation.find_by(from_applicant_id: current_user.id, to_target_id: other_user.id)
    target = FriendRelation.find_by(from_applicant_id: other_user.id, to_target_id: current_user.id)
    if applicant.present?
      applicant.status
    elsif target.present?
      target.status
    end
  end

  def self.are_you_applicant?(current_user, other_user)
    if FriendRelation.exists?(from_applicant_id: current_user.id, to_target_id: other_user.id)
      FriendRelation.find_by(from_applicant_id: current_user.id, to_target_id: other_user.id).status == "申請中"
    else
      return false
    end
  end

  def self.are_you_receiver?(current_user, other_user)
    if FriendRelation.exists?(from_applicant_id: other_user.id, to_target_id: current_user.id)
      FriendRelation.find_by(from_applicant_id: other_user.id, to_target_id: current_user.id).status == "申請中"
    else
      return false
    end
  end

end
