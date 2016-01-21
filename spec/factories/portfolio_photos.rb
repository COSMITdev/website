FactoryGirl.define do
  factory :portfolio_photo do
    # portfolio Portfolio.all.order('RANDOM()').first
    portfolio ""
    description "Breve descrição sobre a foto"
    photo File.open(Rails.root.join('spec', 'fixtures', 'portfolio_photo.jpeg'))
  end
end
