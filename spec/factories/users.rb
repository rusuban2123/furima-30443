FactoryBot.define do
  factory :user do
    nickname { 'testtrue' }
    email    { 'testtrue@test.com' }
    password { 'true0000' }
    password_confirmation { password }
    last_name { '試験テストてすと' }
    first_name { '試験テストてすと' }
    first_kana { 'テスト' }
    last_kana { 'タロウ' }
    birthday { '1931-01-01' }
  end
end
