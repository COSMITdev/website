# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com',
                  avatar: File.open(Rails.root.join('spec', 'fixtures', 'avatar.png')),
                  password: 'password',
                  password_confirmation: 'password')

30.times do |index|
  Post.create!(
    published: [true, false].sample,
    hero_image: File.open(Rails.root.join('spec', 'fixtures', 'image.jpg')),
    title: "Post de Exemplo #{index}",
    body: "## Uma pequena Chamada ### Um H3 S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS S UAHSUAH ASUHUAHU ASUH USHAU HSUAH USAUH hsau h suaHU AHSUH SUAh UHSAU HUASH uASHU SAHU AS T1 | T2 | T3 ---|---|--- Oi| Blah| Foo ",
    slug: "post-de-exemplo-#{index}",
    publish_date: Date.today,
    author: AdminUser.last,
    meta_title: "Post de Exemplo #{index}",
    meta_description: "Quer saber como criar um post? Check this out!",
    meta_tags: "ruby, rails, productivity",
    tag_list: "ruby, rails, productivity"
  )
end
