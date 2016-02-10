FactoryGirl.define do
  factory :post do
    hero_image File.open(Rails.root.join('spec', 'fixtures', 'image.jpg'))
    title "Post de Exemplo"
    body "Lorem ipsum sit dolor amet "*200
    slug "post-de-exemplo"
    publish_date Date.today
    author 1
    meta_title "Post de Exemplo"
    meta_description "Quer saber como criar um post? Check this out!"
    tag_list "ruby, rails, productivity"
  end
end
