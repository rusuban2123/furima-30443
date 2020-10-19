FactoryBot.define do
  factory :user do
    nickname { "test" }
    email    { "test@test.com" }
    password { "test0000" }
    password_confirmation { password }
    last_name { '田村' }
    first_name { '太郎' }
    first_kana { 'タムラ' }
    last_kana { 'タロウ' }
    birthday { '1931-01-01' }
  end
end