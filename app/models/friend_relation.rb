class FriendRelation < ApplicationRecord
  belongs_to :from_applicant, class_name: "User"
  belongs_to :to_target, class_name: "User"
end
