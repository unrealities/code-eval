class NiceAngles
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      float_angle = line.strip.to_f
      int_angle = float_angle.to_i
      dec_angle = float_angle - int_angle.to_f
      min_angle = (dec_angle * 60).to_i
      sec_angle = ((dec_angle * 60 - min_angle) * 60).to_i
      puts int_angle.to_s + '.' + "%02d" % min_angle.to_s + '\'' + "%02d" % sec_angle.to_s + '"'
    end
  end
end

# NiceAngles.new
