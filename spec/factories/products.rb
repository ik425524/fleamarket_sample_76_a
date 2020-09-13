FactoryBot.define do
  factory :product do
    name         {"DVD"}
    description  {"おすすめです。"}
    price        {10000}
    category
    region
    state
    cost
    period
    size
    user
  end
end