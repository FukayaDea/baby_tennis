FactoryBot.define do

  factory :user do
    nickname { "abe" }
    email { "kkk@gmail.com" }
    password { "hogeHOGE7" }
    over20 { 1 }
    agree { 1 }

  
    
  end

  factory :user2, class: User do
    nickname { "kato" }
    email { "kkk@gmail.com" }
    password { "hogeHOGE7" }
    over20 { 1 }
    agree { 1 }
  end

end