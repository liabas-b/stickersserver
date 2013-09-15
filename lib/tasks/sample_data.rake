namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_locations
  end
end

def make_locations
  1000.times do |n|
    location = Location.create!(sticker_code: '6b19ad97ebf04815c2fdd5470e5f2aa7', options: '{ active: true }', latitude: (-50 + rand(130)), longitude: (-130 + rand(180)))
    location.update_attributes(date: location.created_at)
  end
end