paul = User.create(
  first_name: "Paul",
  last_name:  "Paulson",
  email:      "Paulson@fake.net",
  password: "1ZSfdsAxA45",
  sign_in_count: 1
)

weather = Api.create(
  name: "Weather API for Noobs",
  url: "www.wunderground.com/something123456789",
  description: "This is a weather API that shows people weather.",
  paid: false,
  user: paul
)

Api.create(
  name: "MBTA in MA",
  url: "www.mbtanicenice.com/indoooowww/osaoosossa/o222224",
  description: "This is an awesome MBTA times API. IT WILL CHANGE YOUR WORLD.",
  paid: true,
  user: paul
)

Review.create(
  title: "Worst Weather API!",
  body: "It said it would rain, I hate it!",
  rating: 1,
  user: paul,
  api: weather
)
