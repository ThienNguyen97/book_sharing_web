Role.create(name: 'admin')

user1 = User.create(email: 'admin@test.com',
          password: '123456',
          password_confirmation: '123456',
          name: 'Admin')
user1.add_role(:admin)

User.create!([
  {email: "vutuananhsama@gmail.com", name: "Anh",
   password: "1234567", password_confirmation: "1234567",
  },
  {email: "tuananh77717@gmail.com", name: "Anh",
   password: "1234567", password_confirmation: "1234567",
  },
  {email: "vu.tuan.anhb@sun-asterisk.com", name: "Anh",
   password: "1234567", password_confirmation: "1234567",
  },
  {email: "abc@gamil.com", name: "Anh",
   password: "1234567", password_confirmation: "1234567",
  },
  {email: "123@gmail.com", name: "Anh",
   password: "1234567", password_confirmation: "1234567",
  },
])

58.times do |n|
  User.create!(
    email: Faker::Name.first_name+n.to_s+"@gmail.com",
    name: Faker::Name.name,
    password: "1234567", password_confirmation: "1234567",
  )
end

Post.create!([
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 2,
  book_name: "Mina no nihongo"},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 2,
  book_name: "Mina no nihongo 1 "},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 2,
  book_name: "Mina no nihongo 2 "},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 3,
  book_name: "Mina no nihongo 1"},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 4,
  book_name: "Mina no nihongo"},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 3,
  book_name: "Mina no nihongo"},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 2,
  book_name: "Mina no nihongo"},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 3,
  book_name: "Mina no nihongo"},
])

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
