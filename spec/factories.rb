FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "elias#{n}@innku.com"
    end    
    role     'admin'
    password 'secret'
    password_confirmation 'secret'
  end

  factory :article do
    name        'IE hate'
    description 'Las cosas que detestamos de IE'
    content     'Falta de convenciones'
    published   true
    association :user
    association :category
  end

  factory :draft, :parent => :article do
    published false
  end

  factory :category do
    name 'IE stuff'
  end
end

