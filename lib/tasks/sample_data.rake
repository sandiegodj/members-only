namespace :db do
  desc "Fill database with sample users"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@membersonly.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@membersonly.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end

namespace :db do
  desc "Fill database with sample users"
  task populate: :environment do
    Post.create!(title: "Example title ",
                 body: "Sample text",
                 user_id: 1)
    99.times do |n|
      title  = "#{n+1}-sample title"
      body =  "#{n+1}-sample text"
      user_id = n + 1
      Post.create!(title: title,
                   body: body,
                   user_id: user_id)
    end
  end
end

