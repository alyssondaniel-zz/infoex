FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }

    factory :user_with_role_newuser do
      after(:stub) do |user|
        user.add_role :newuser
      end
    end

    factory :user_with_role_admin do
      after(:stub) do |user|
        user.add_role :admin
      end
    end

    # factory :user_with_roles do
    #   transient do
    #     roles_count 5 # default number
    #   end
    #
    #   after(:create) do |user, evaluator|
    #     create_list(:role, evaluator.roles_count, user: user)
    #   end
    # end

  end
end
