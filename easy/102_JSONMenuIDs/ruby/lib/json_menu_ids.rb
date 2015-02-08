require 'json'

class JsonMenuIDs
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      items = JSON.parse(line.strip)["menu"]["items"].compact
      items.map! do |item|
        item["label"].nil? ? 0 : item["label"].split(' ')[1].to_i
      end
      puts items.reduce(:+)
    end
  end 
end

# JsonMenuIDs.new
