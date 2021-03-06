FactoryBot.define do
  factory :product do
    sequence(:product_name) { |n| "商品#{n}" }
    product_explanation { "商品説明" }
    product_status_id { "1" }
    shipping_method_id { "1" }
    shipping_charge_id { "1" }
    prefecture_id { "1" }
    days_until_shipping_id { "1" }
    price { 100 }
    status { "出品中" }
    user_id { 1 }
    after(:build) do |product|
      product.images << build(:image, product: product)
    end
  end

  factory :another_product do
    product_name { "商品2" }
    product_explanation { "商品説明" }
    product_status_id { "1" }
    shipping_method_id { "1" }
    shipping_charge_id { "1" }
    prefecture_id { "1" }
    days_until_shipping_id { "1" }
    price { 100 }
    status { "出品中" }
    user_id { 1 }
    after(:build) do |product|
      product.images << build(:image, product: product)
    end
  end
end
