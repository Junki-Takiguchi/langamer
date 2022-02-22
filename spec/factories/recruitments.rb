FactoryBot.define do
  factory :admin_recruitment, class: Recruitment do
    title { Faker::Creature::Animal.name }
    content { Faker::Book.title }
    user_id { User.find_by(admin: true) }
  end

  factory :recruitment, class: Recruitment do
    title { Faker::Creature::Animal.name }
    content { Faker::Book.title }
    user_id { User.find_by(admin: false) }
  end

end
