def file_size(filePath)
  File.open(filePath).size
end

puts file_size(ARGV[0])
