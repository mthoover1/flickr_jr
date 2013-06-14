require 'faker'

users = []

10.times do
  users << User.create(username: Faker::Internet.user_name,
              email: Faker::Internet.email,
              password: BCrypt::Password.create("123"))
end

urls = [
        "http://www.atsinstitute.edu/images/chicago.jpg",
        "http://www.issmsmsna2012.org/site/uploads/images/Chicago%20Skyline.jpg",
        "http://www.aviewoncities.com/img/chicago/kveus9752s.jpg",
        "http://abovethelaw.com/wp-content/uploads/2013/04/chicago-sales1.jpg",
        "http://images.nationalgeographic.com/wpf/media-live/photos/000/253/cache/lightning-sears-tower-chicago_25301_990x742.jpg?01RI=06FCB96EFF9250D,cm:akamai.mathtag.com%2Fevent%2Fimg%3Fakam_state%3D0%26akid%3D31nLaCpQddAauUe2RlLD8W5s1R5t9yKHP7PyGPQZ2kEJiRBL6LakFKw%26no_log&01NA=ck&",
        "http://www.vipsaccess.com/hotels/chicago/chicago.jpg",
        "http://thefullpint.com/wp-content/uploads/2012/01/Chicago_Illinois.jpeg",
        "http://tiptopwebsite.com/photos4/cpc/chicago1.jpg"
                                                            ]

random = [1,2,3]

albums = []

users.each do |user|
  random.sample.times do
    albums << Album.create(name: Faker::Lorem.sentence(word_count = 3),
                           user_id: user.id)
  end
end


count = (1..12).to_a

albums.each do |album|
  count.sample.times do
    Photo.create(album_id: album.id, 
                 url: urls.sample,
                 name: Faker::Lorem.sentence(word_count = 2))
  end
end

