FactoryBot.define do
  factory :category do
  end
  
  factory :user do
    nickname              { "abe" }
    email                 { "kkk@gmail.com" }
    password              { "0000000" }
    password_confirmation { "0000000" }
    family_name_kanji     { "阿部" }
    first_name_kanji      { "太郎" }
    family_name_kana      { "アベ" }
    first_name_kana       { "タロウ" }
    birthday_y_m_d        { "2000-01-01" }
  end
end
