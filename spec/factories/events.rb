FactoryBot.define do

  factory :event do
    event_date { 20180531 }
    prefecture { "東京都" }
    court { "ほげ" }
    court_url { "http://www.netyasun.com/home/color.html" }
    meeting_place { "南町田駅" }
    meeting_time { "09:00" }
    access { "町田駅" }
    budget { 500 }
    max_member { 5 }
    racket { 1 }
    remarks { "南町田駅" }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    updated_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }



    after(:build) do |event|
      class << event
       def create_group
         true
       end
      end
    end

    factory :event_with_create_group do
      after(:build) do |event|
        class << event
          def create_group
            super
          end
        end
      end
    end
  end

end