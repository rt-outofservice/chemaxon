#! /usr/bin/env ruby

require_relative "lib/parse_files"
include ParseFiles

def parse_weather(file, exp)
  resHsh = Hash.new
  fileArrParsed = get_parsed_array(file, exp)
  fileArrParsed.each_index {|x| resHsh[fileArrParsed[x][0].to_i] = fileArrParsed[x][2].to_i - fileArrParsed[x][2].to_i}

  return min_hash_value(resHsh)[0]
end

puts parse_weather('data/weather.dat', '^\s*([0-9]*)\W*([0-9]*)\W*([0-9]*)')