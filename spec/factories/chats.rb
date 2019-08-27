FactoryBot.define do

  factory :chat do
    text { "hoge" }
    created_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  
    
  end

end