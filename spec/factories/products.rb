FactoryBot.define do
  factory :product do
    description        { 'テストテキスト' }
    name               { 'テストネーム' }
    category_id        { '1' }
    state_id           { '1' }
    load_id            { '1' }
    shipment_source_id { '1' }
    day_to_ship_id     { '1' }
    price              { 1000 }
    association :user
  end
end
