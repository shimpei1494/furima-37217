FactoryBot.define do
  factory :purchase_delivery_address do

    token {'token'}
    post_code {'000-0000'}
    prefecture_id {rand(2..48)}
    city {'city'}
    address {'address'}
    building_name {'building'}
    phone_number {'01234567891'} #10桁か11桁

  end
end
