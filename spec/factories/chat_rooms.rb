FactoryBot.define do

  factory :friend, class: FriendRelation do
    from_applicant_id { User.find_by(email: "rspec_user@sample.com").id }
    to_target_id { User.find_by(email: "rspec_admin@sample.com").id }
    status { 1 }
  end

  factory :target, class: FriendRelation do
    from_applicant_id { User.find_by(email: "rspec_admin@sample.com").id }
    to_target_id { User.find_by(email: "rspec_user@sample.com").id }
    status { 2 }
  end

  factory :target02, class: FriendRelation do
    from_applicant_id { User.find_by(email: "rspec_user02@sample.com").id }
    to_target_id { User.find_by(email: "rspec_user@sample.com").id }
    status { 2 }
  end

  factory :chat_room do
  end

  factory :admin_participant, class: Participant do
    user_id { User.find_by(email: "rspec_admin@sample.com").id }
    chat_room_id { ChatRoom.last.id }
  end

  factory :user_participant, class: Participant do
    user_id { User.find_by(email: "rspec_user@sample.com").id }
    chat_room_id { ChatRoom.last.id }
  end

end
