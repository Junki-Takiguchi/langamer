FactoryBot.define do

  factory :friend_relation, class: FriendRelation do
    from_applicant_id { User.find_by(admin: true) }
    to_target_id { User.find_by(admin: false) }
    status { 1 }
  end

  factory :admin_applicant, class: FriendRelation do
    from_applicant_id { User.find_by(admin: true) }
    to_target_id { User.find_by(admin: false) }
    status { 2 }
  end

  factory :user_applicant, class: FriendRelation do
    from_applicant_id { User.find_by(admin: false) }
    to_target_id { User.find_by(admin: true) }
    status { 2 }
  end

  factory :chat_room do
  end

  factory :admin_participant, class: Participant do
    user_id { User.find_by(admin: true) }
    chat_room_id { ChatRoom.first.id }
  end

  factory :user_participant, class: Participant do
    user_id { User.find_by(admin: false) }
    chat_room_id { ChatRoom.first.id }
  end

end
