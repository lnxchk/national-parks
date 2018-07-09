#!/opt/chefdk/embedded/bin/ruby

require 'json'

# refactor this to opts
file = ARGV[0]
table_name = ARGV[1]

parks_file = File.read(file)

parks_hash = JSON.parse(parks_file)

parks_hash.each do |park|

  out_string = ""
  out_string += "{\n"
  out_string += "  \"Location Number\": {\"S\":\"#{park['Location Number']}\"},\n"
  out_string += "  \"Location Name\": {\"S\":\"#{park['Location Name']}\"},\n"
  out_string += "  \"Address\": {\"S\":\"#{park['Address']}\"},\n"
  out_string += "  \"City\": {\"S\":\"#{park['City']}\"},\n"
  out_string += "  \"State\": {\"S\":\"#{park['State']}\"},\n"
  out_string += "  \"Zip Code\": {\"S\":\"#{park['Zip Code']}\"},\n"
  out_string += "  \"Phone Number\": {\"S\":\"#{park['Phone Number']}\"},\n"
  out_string += "  \"Fax Number\": {\"S\":\"#{park['Fax Number']}\"},\n"
  out_string += "  \"Latitude\": {\"S\":\"#{park['Latitude']}\"},\n"
  out_string += "  \"Longitude\": {\"S\":\"#{park['Longitude']}\"}\n"
  out_string += "}"

  # write a temp file
  # open
  File.write('item.json', out_string)
  `aws dynamodb put-item --table-name #{table_name} --item file://item.json`
  File.delete('item.json')

end
