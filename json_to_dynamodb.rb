#!/opt/chefdk/embedded/bin/ruby

require 'json'

# refactor this to opts
file = ARGV[0]
table_name = ARGV[1]

parks_file = File.read(file)

parks_hash = JSON.parse(parks_file)

# set up the top of the file
puts "{"
puts "  \"#{table_name}\": ]"

parks_hash.each do |park|
  puts "      {"
  puts "        \"PutRequest\": {"
  puts "           \"Item\": {"
  puts "              \"Location Number\": {\"S\":\"#{park['Location Number']}\"},"
  puts "              \"Location Name\": {\"S\":\"#{park['Location Name']}\"},"
  puts "              \"Address\": {\"S\":\"#{park['Address']}\"},"
  puts "              \"City\": {\"S\":\"#{park['City']}\"},"
  puts "              \"State\": {\"S\":\"#{park['State']}\"},"
  puts "              \"Zip Code\": {\"S\":\"#{park['Zip Code']}\"},"
  puts "              \"Phone Number\": {\"S\":\"#{park['Phone Number']}\"},"
  puts "              \"Fax Number\": {\"S\":\"#{park['Fax Number']}\"},"
  puts "              \"Latitude\": {\"S\":\"#{park['Latitude']}\"},"
  puts "              \"Longitude\": {\"S\":\"#{park['Longitude']}\"},"
  puts "              \"Location\":{\"S\":{\"coordinates\":#{park['Location']['coordinates']},\"type\":\"#{park['Location']['type']}\"}"
  puts "      }" # close Item
  puts "    }"   # close PutRequest
  puts "  }"     # close top structure

end

# close the structure
puts "  ]"
puts "}"

