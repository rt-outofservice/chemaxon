#! /usr/bin/env ruby

require_relative "lib/parse_files"
include ParseFiles

def parse_football(file, exp)
  resHsh = Hash.new
  fileArrParsed = get_parsed_array(file, exp)
  fileArrParsed.each_index {|x| resHsh[fileArrParsed[x][0]] = fileArrParsed[x][1].to_i - fileArrParsed[x][2].to_i if fileArrParsed[x][1].to_i - fileArrParsed[x][2].to_i > 0}

  return min_hash_value(resHsh)[0]
end

puts parse_football('data/football.dat', '^\s+\d+\.\s(\w+)\s+\d+\s+\d+\s+\d+\s+\d+\s+(\d+)\s+-\s+(\d+)\s+\d+')
