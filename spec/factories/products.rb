FactoryBot.define do
  factory :product do
    title { "ProductTitle" }
    description { "Best in town" }
    price { 49 }
    category { "mains" }
  end
end
