FactoryBot.define do
  factory :admin_recruitment, class: Recruitment do
    title { "admin-post" }
    content { Faker::Book.title }
    user_id { User.find_by(email: "rspec_admin@sample.com").id }
  end

  factory :user_recruitment, class: Recruitment do
    title { "user-post" }
    content { Faker::Book.title }
    user_id { User.find_by(email: "rspec_user@sample.com").id }
  end

end
