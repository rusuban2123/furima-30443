FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    encrypted_password    {"test0000"}
    encrypted_password_confirmation    {encrypted_password}
    first_name            {"試験"}
    last_name             {"一号"}
    first_kana            {"テスト"}
    last_kana             {"イチゴウ"}
    birthday              {"1932-06-05"} 
  end
end