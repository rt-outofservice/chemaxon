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
      arr = file_to_array('spec/data/football_data_for_tests.dat')
      expect(arr.count).to be > 0
    end
  end

  describe "parse_regexp" do
    it "parse srings with regexp" do
      arr = parse_regexp('    1. Arsenal         38    26   9   3    79  -  36    87', '^\s+\d+\.\s(\w+)\s+\d+\s+\d+\s+\d+\s+\d+\s+(\d+)\s+-\s+(\d+)\s+\d+')
      expect(arr[0].to_s).to eq('Arsenal')
      expect(arr[1].to_i).to eq(79)
      expect(arr[2].to_i).to eq(36)
    end
  end
  
  describe "get_parsed_array" do
    it "wrapper over file_to_array and parse_regexp" do
      arr = get_parsed_array('spec/data/football_data_for_tests.dat', '^\s+\d+\.\s(\w+)\s+\d+\s+\d+\s+\d+\s+\d+\s+(\d+)\s+-\s+(\d+)\s+\d+')
      expect(arr[2][0].to_s).to eq('Liverpool')
      expect(arr[2][1].to_i).to eq(67)
      expect(arr[2][2].to_i).to eq(30)
    end
  end

  describe "min_hash_value" do
    it "get min value from hash" do
      val = min_hash_value('k' => 11, 'k2' => 5, 'k3' => 12, 'k4' => 7, 'k5' => 9, 'k6' => 7)
      expect(val[0]).to eq('k2')
     end
  end

  describe "parse_weather" do
    it "main method to parse weather.dat" do
      val = parse_weather('spec/data/weather_data_for_tests.dat', '^\s*([0-9]*)\W*([0-9]*)\W*([0-9]*)')
      expect(val.to_i).to eq(14)
    end
  end

  describe "parse_football" do
    it "main method to parse football.dat" do
      val = parse_football('spec/data/football_data_for_tests.dat', '^\s+\d+\.\s(\w+)\s+\d+\s+\d+\s+\d+\s+\d+\s+(\d+)\s+-\s+(\d+)\s+\d+')
    expect(val).to eq('Blackburn')
    end
  end
end