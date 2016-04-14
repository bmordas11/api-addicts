user1 = User.create(first_name: "Richie",last_name: 'Cunningham',
  email: "to@example.com", password: 'password',
    password_confirmation: 'password')

user2 = User.create(first_name: "Adam",last_name: 'Khan',
  email: "beto@example.com", password: 'password123',
    password_confirmation: 'password123')

api1 = Api.create(name: "google Api", url: "www.google.com",
  description: "This is an awesome paid API", paid: true, user: user1)

api2 = Api.create(name: "google Api", url: "www.google.com",
  description: "This is an awesome paid API", paid: true, user: user2)

tag1 = Tag.create(name: "facebook")
tag2 = Tag.create(name: "zacebook")

admin = User.create(first_name: "jhon",last_name: 'admin',
  email: "admin@example.com", password: 'leavemealone',
  password_confirmation: 'leavemealone', admin: true)

ApiTag.create(api: api1, tag: tag1)
