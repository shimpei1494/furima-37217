FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname {person.first.romaji}
    email {Faker::Internet.free_email}
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) 
    password {password}
    password_confirmation {password}
    family_name {person.last.kanji}
    first_name {person.first.kanji}
    family_name_kana {person.last.katakana}
    first_name_kana {person.first.katakana}
    # 1930年1月1日から本日の5年前までをランダムに取得
    birth_day {Faker::Date.between(from: '1930-01-01', to: Date.today << 60)}
  end
end