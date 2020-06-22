Role.create(name: 'admin')

user1 = User.create(email: 'admin@gmail.com',
          password: '123456',
          password_confirmation: '123456',
          name: 'Admin')
user1.add_role(:admin)

User.create!([
  {email: "vutuananh@gmail.com", name: "Vu Tuan Anh",
   password: "1234567", password_confirmation: "1234567",
  },
  {email: "tuananh77717@gmail.com", name: "Tuan Anh",
   password: "1234567", password_confirmation: "1234567",
  },
  {email: "menkisede2@gmail.com", name: "Vu Le",
   password: "1234567", password_confirmation: "1234567",
  },
  {email: "abc@gmail.com", name: "Hoang Nam",
   password: "1234567", password_confirmation: "1234567",
  },
  {email: "123@gmail.com", name: "Vu Huy",
   password: "1234567", password_confirmation: "1234567",
  },
])

994.times do |n|
  User.create!(
    email: Faker::Name.first_name+n.to_s+"@gmail.com",
    name: Faker::Name.name,
    password: "1234567", password_confirmation: "1234567",
  )
end

Post.create!([
  {title: Faker::Lorem.sentence,
  content: "Sach tieng Nhat co ban #n5 cho ban nao can. #tiengNhat.",
  user_id: 2,
  book_name: "Mina no nihongo",
  subject: "ITSS",
  semester: "Ky 3"},
  {title: Faker::Lorem.sentence,
  content: "Sach tieng Nhat co ban #n3 cho ban nao can. #tiengNhat #ITSS.",
  user_id: 2,
  book_name: "Mina no nihongo 1 ",
  subject: "ITSS",
  semester: "Ky 3"},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 2,
  book_name: "Mina no nihongo 2 ",
  subject: "ITSS",
  semester: "Ky 3"},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 3,
  book_name: "Mina no nihongo 1",
  subject: "ITSS",
  semester: "Ky 3"},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 4,
  book_name: "Mina no nihongo",
  subject: "ITSS",
  semester: "Ky 3"},
  {title: Faker::Lorem.sentence,
  content: "Sach tieng Nhat #n3 cho ban on thi Nang luc tieng Nhat. #tiengNhat #ITSS.",
  user_id: 3,
  book_name: "Mina no nihongo",
  subject: "ITSS",
  semester: "Ky 3"},
  {title: Faker::Lorem.sentence,
  content: Faker::Lorem.paragraph(sentence_count:20),
  user_id: 2,
  book_name: "Mina no nihongo",
  subject: "ITSS",
  semester: "Ky 3"},
  {title: Faker::Lorem.sentence,
  content: "Sach tieng Nhat #n3 cho ban on thi Nang luc tieng Nhat. #tiengNhat #ITSS.",
  user_id: 3,
  book_name: "Mina no nihongo",
  subject: "ITSS",
  semester: "Ky 3"},
])

users = User.order(:created_at).take(500)
users.each do |user|
  2.times do |n|
    Post.create!(
  title: Faker::Lorem.sentence,
  content: "Sach tieng Nhat co ban #n5 cho ban nao can. #tiengNhat.",
  user_id: user.id,
  book_name: "Mina no nihongo",
  subject: "ITSS",
  semester: "Ky 3")
  end
  2.times do |n|
    Post.create!(
  title: Faker::Lorem.sentence,
  content: "Sach chuyen nganh #ITSS #ky8 cho ban nao can. Cac ban comment de minh biet nha.",
  user_id: user.id,
  book_name: "Tieng Nhat giao tiep.",
  subject: "Nhat 7",
  semester: "Ky 8")
  end
  2.times do |n|
    Post.create!(
  title: Faker::Lorem.sentence,
  content: "Sach chuyen nganh #laptrinh #ky5 cho ban nao can. Cac ban comment de minh biet nha.",
  user_id: user.id,
  book_name: "Mina no nihongo",
  subject: "Lap trinh huong doi tuong",
  semester: "Ky 5")
  end
end

user  = users.first
following = users[2..100]
followers = users[3..100]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


users = users[3..50]
users.each do |user|
  10.times do |n|
   # user.follow(user.id + n)
   user1 = User.find(user.id + n + 1)
   user.follow(user1)
   user1.follow(user)
 end
end


users = User.order(:created_at).take(6)
posts = Post.order(:created_at).take(100)
posts.each do |post|
  users.each do |user|
    Comment.create!( content: Faker::Lorem.sentence,
      user_id: user.id,
      post_id: post.id )
    Like.create!(
      user_id: user.id,
      post_id: post.id )
  end
end
