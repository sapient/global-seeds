require 'rubygems'
require 'bundler/setup'

require 'seed-fu'
require 'csv'

SeedFu::Writer.write('countryseeds.rb', :class_name => 'Country') do |writer|
  CSV.foreach( "countries.csv", :headers => true, :header_converters => :symbol ) do |line|
    country = line.to_hash
    # You can now manipulate the hash here, rename keys, remove them etc
    country.delete(:countryid)
    writer << country
  end
end

SeedFu::Writer.write('cityseeds.rb', :class_name => 'City') do |writer|
  CSV.foreach( "cities.csv", :headers => true, :header_converters => :symbol ) do |line|
    city = line.to_hash
    writer << city
  end
end

