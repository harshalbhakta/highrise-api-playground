require 'highrise'

# Set api and site in ~/.bashrc
# export HIGHRISE_API="xxxxx"
# export HIGHRISE_SITE="https://xxxxx.highrisehq.com"
puts "API: #{ENV['HIGHRISE_API']}"
puts "SITE: #{ENV['HIGHRISE_SITE']}"

Highrise::Base.site = ENV['HIGHRISE_SITE']
Highrise::Base.user = ENV['HIGHRISE_API']
Highrise::Base.format = :xml

@tags = Highrise::Tag.find(:all)

puts "tags count: #{@tags.count}"

@people = Highrise::Person.find_all_across_pages(:params => {:lead_status => "Won"})

@people.each do |person|

  notes = person.notes

  puts "--------------"
  puts "Name: #{person.name}"
  puts "Latest Note: #{notes.first.body}"
  puts "Date: #{notes.first.created_at}"

end
