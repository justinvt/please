# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Page.all.each{|p| p.destroy}

4.times do |i|
  Page.sample
end

Page.all.each do |page|
  puts "Scrape #{page.url}"
  page.scrape
end