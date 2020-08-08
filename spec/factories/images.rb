FactoryBot.define do
  factory :image do
    src   {File.open("#{Rails.root}/spec/fixtures/imagetest.jpeg")}
  end
end