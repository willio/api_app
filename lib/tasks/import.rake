require "open-uri"
require "json"

task :coursera_import => :environment do

  content = open("https://api.coursera.org/api/catalog.v1/courses?fields=language,shortDescription").read
  courses = JSON.parse(content)["elements"]

  courses.each do |course|
    db = Import.new 
    db.name = course["name"]
    db.other = course["shortDescription"]
    db.save
  end

end