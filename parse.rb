# Ruby Script to convert CSV to geoJSON
# Usage: `ruby parse.rb` in the same folder as `data.csv`
# Outputs `data.geojson` for use on GitHub (or elsewhere)
# Source: https://data.cms.gov/dataset/CMS-Innovation-Center-Model-Participants/x8pc-u7ta

require 'csv'
require 'json'

# init global geojson object
geojson = {
  "type" => "FeatureCollection",
  "features" => []
}

keys = []

CSV.foreach("data.csv") do |row|

  # build an array of keys from the table header
  # and skip the first row
  if keys == []
    keys = row
    next
  end

  # build an object of each row's properties
  # inter-splice the keys we figured out on the first pass
  # todo: there's got to be a cleaner way to do this
  properties = {}
  row.each_with_index do |field, index|
    next if field.nil?
    properties[ keys[index] ] = field
  end

  # parse latlong from string in the form of
  # [Address] (X, Y)
  latlong = /.*\((?<long>.*?), (?<lat>.*?)\)/.match row[3]

  # Couldn't find a latlong, skip to prevent errors
  next if latlong.nil?

  # create feature object
  feature = {
    "type" => "Feature",
    "geometry" => {
      "type" => "Point",
      "coordinates" => [
        latlong[:lat].to_f, latlong[:long].to_f
      ],
    },
    "properties" => properties
  }

  # Add feature to feature collection
  geojson["features"].push feature

end

File.open("data.geojson","w") do |f|
  f.write JSON.pretty_generate geojson
end