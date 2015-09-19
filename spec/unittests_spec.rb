require 'rspec'
require_relative "../weather"
require_relative "../football"

describe ParseFiles do
  class DummyClass
  end

  before(:all) do
    @dummy = DummyClass.new
    @dummy.extend ParseFiles
  end

  describe "file_to_array" do
    it "read file and return array" do
      puts ' '
      puts "###################################"
      puts ' '
      puts "TEST 1"
      puts "Test 'file_to_array' method with 'spec/data/football_data_for_tests.dat'."
      arr = file_to_array('spec/data/football_data_for_tests.dat')
      puts "Expected value: '> 0', got value: '#{arr.count}'."
      expect(arr.count).to be > 0
      puts ' '
      puts "----------------------------------"
      puts ' '
    end
  end

  describe "parse_regexp" do
    it "parse srings with regexp" do
      puts "TEST 2"
      puts "Test 'parse_regexp' method with string '    1. Arsenal         38    26   9   3    79  -  36    87' and expression '^\s+\d+\.\s(\w+)\s+\d+\s+\d+\s+\d+\s+\d+\s+(\d+)\s+-\s+(\d+)\s+\d+'."
      arr = parse_regexp('    1. Arsenal         38    26   9   3    79  -  36    87', '^\s+\d+\.\s(\w+)\s+\d+\s+\d+\s+\d+\s+\d+\s+(\d+)\s+-\s+(\d+)\s+\d+')
      puts "Expected values: 'Arsenal/79/36', got values: '#{arr[0].to_s}/#{arr[1].to_i}/#{arr[2].to_i}'."
      expect(arr[0].to_s).to eq('Arsenal')
      expect(arr[1].to_i).to eq(79)
      expect(arr[2].to_i).to eq(36)
      puts ' '
      puts "----------------------------------"
      puts ' '
    end
  end

  describe "get_parsed_array" do
    it "wrapper over file_to_array and parse_regexp" do
      puts "TEST 3"
      puts "Test method (wrapper) 'get_parsed_array' with 'spec/data/football_data_for_tests.dat'."
      arr = get_parsed_array('spec/data/football_data_for_tests.dat', '^\s+\d+\.\s(\w+)\s+\d+\s+\d+\s+\d+\s+\d+\s+(\d+)\s+-\s+(\d+)\s+\d+')
      puts "Expected values: 'Liverpool/67/30, got values: '#{arr[2][0].to_s}/#{arr[2][1].to_i}/#{arr[2][2].to_i}'."
      expect(arr[2][0].to_s).to eq('Liverpool')
      expect(arr[2][1].to_i).to eq(67)
      expect(arr[2][2].to_i).to eq(30)
      puts ' '
      puts "----------------------------------"
      puts ' '
    end
  end

  describe "min_hash_value" do
    it "get min value from hash" do
      puts "TEST 4"
      puts "Test 'min_hash_value' method with hash '{'k' => 11, 'k2' => 5, 'k3' => 12, 'k4' => 7, 'k5' => 9, 'k6' => 7}'."
      val = min_hash_value('k' => 11, 'k2' => 5, 'k3' => 12, 'k4' => 7, 'k5' => 9, 'k6' => 7)
      puts "Expected value: 'k2', got value: '#{val[0]}'."
      expect(val[0]).to eq('k2')
      puts ' '
      puts "----------------------------------"
      puts ' '
     end
  end

  describe "parse_weather" do
    it "main method to parse weather.dat" do
      puts "TEST 5"
      puts "Test general result of weather.rb execution."
      val = parse_weather('spec/data/weather_data_for_tests.dat', '^\s*([0-9]*)\W*([0-9]*)\W*([0-9]*)')
      puts "Expected value: '14', got value: '#{val.to_i}'."
      expect(val.to_i).to eq(14)
      puts ' '
      puts "----------------------------------"
      puts ' '
    end
  end

  describe "parse_football" do
    it "main method to parse football.dat" do
      puts "TEST 6"
      puts "Test general result of football.rb execution."
      val = parse_football('spec/data/football_data_for_tests.dat', '^\s+\d+\.\s(\w+)\s+\d+\s+\d+\s+\d+\s+\d+\s+(\d+)\s+-\s+(\d+)\s+\d+')
      puts "Expected value: 'Blackburn', got value: '#{val}'."
      expect(val).to eq('Blackburn')
      puts ' '
      puts "###################################"
      puts ' '
    end
  end
end