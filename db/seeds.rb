# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

30.times do |index|
  Portfolio.create!(
    logo: File.open(Rails.root.join('spec', 'fixtures', 'customer_logo.jpeg')),
    cover: File.open(Rails.root.join('spec', 'fixtures', 'customer_cover.jpeg')),
    title: "Cliente de mentirinha",
    body: "Lorem ipsum dolor sit amet "*300,
    working_time: 5,
    working_time_type: PortfolioWorkingTimeType::DAYS
  )

  5.times do |index|
    PortfolioPhoto.create!(
      portfolio: Portfolio.last,
      photo: File.open(Rails.root.join('spec', 'fixtures', 'portfolio_photo.jpeg')),
      description: "descrição #{index}"
    )
  end
end
