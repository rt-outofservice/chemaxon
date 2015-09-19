#! /usr/bin/env ruby

module ParseFiles
  def file_to_array (path)
    fileArr = Array.new()
    File.open(path, "r") do |f|
      f.each_line do |line|
        fileArr.push(line)
      end
    end
    return fileArr
  end

  def parse_regexp(str, expression)
    strArr = Array.new()
    if match = str.match(expression)
      strArr.push(match.captures)
    end
    return strArr.flatten
  end

  def get_parsed_array(path, expression)
    fileArr = file_to_array(path)
    fileArrParsed = Array.new()
    fileArr.each_index {|x| fileArrParsed.push(parse_regexp(fileArr[x].to_s, expression)) if parse_regexp(fileArr[x].to_s, expression).all? {|x| x.to_s != ''}}
    return fileArrParsed  
  end

  def min_hash_value(hash)
    return hash.min_by{|k,v| v}
  end
  

  def parse_football(file, exp)
    resHsh = Hash.new
    fileArrParsed = get_parsed_array(file, exp)
    fileArrParsed.each_index {|x| resHsh[fileArrParsed[x][0]] = fileArrParsed[x][1].to_i - fileArrParsed[x][2].to_i if fileArrParsed[x][1].to_i - fileArrParsed[x][2].to_i > 0}

    return min_hash_value(resHsh)[0]
  end
end