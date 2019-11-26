FactoryBot.define do

  factory :user do
    nickname              {"tsubasa"}
    sequence(:email)      {Faker::Internet.email}
    lastname_kanji        {"小澤"}
    firstname_kanji       {"翼"}
    lastname_kana         {"オザワ"}
    firstname_kana        {"ツバサ"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end