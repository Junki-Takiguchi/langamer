class FriendRelation < ApplicationRecord
  belongs_to :from_applicant_user, class_name: "User"
  belongs_to :to_target_user, class_name: "User"
end
