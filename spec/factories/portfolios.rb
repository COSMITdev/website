FactoryGirl.define do
  factory :portfolio do
    logo File.open(Rails.root.join('spec', 'fixtures', 'customer_logo.jpeg'))
    cover File.open(Rails.root.join('spec', 'fixtures', 'customer_cover.jpeg'))
    title "Cliente de mentirinha"
    body "Lorem ipsum dolor sit amet "*300
    working_time 5
    working_time_type PortfolioWorkingTimeType::DAYS
  end
end
