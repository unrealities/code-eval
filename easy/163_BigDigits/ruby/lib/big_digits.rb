class BigDigits
  NUM_ART = [
    %w(-**-- *--*- *--*- *--*- -**-- -----),
    %w(--*-- -**-- --*-- --*-- -***- -----),
    %w(***-- ---*- -**-- *---- ****- -----),
    %w(***-- ---*- -**-- ---*- ***-- -----),
    %w(-*--- *--*- ****- ---*- ---*- -----),
    %w(****- *---- ***-- ---*- ***-- -----),
    %w(-**-- *---- ***-- *--*- -**-- -----),
    %w(****- ---*- --*-- -*--- -*--- -----),
    %w(-**-- *--*- -**-- *--*- -**-- -----),
    %w(-**-- *--*- -***- ---*- -**-- -----)
  ]
  NUM_ART_HEIGHT = 6
  
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      num_string = line.strip.gsub(/[^0-9]/,'')
      output_array = Array.new(num_string.length) {Array.new(NUM_ART_HEIGHT)}
      num_string.split('').each_with_index do |num, i|
        output_array[i].each_index do |j|
          output_array[i][j] = NUM_ART[num.to_i][j]
        end
      end
      final_array = Array.new(NUM_ART_HEIGHT, '')
      output_array.each do |output_line|
        output_line.each_with_index do |str, i|
          final_array[i] = final_array[i] + str
        end
      end
      final_array.each do |final_num|
        puts final_num
      end
    end
  end
end

# BigDigits.new
