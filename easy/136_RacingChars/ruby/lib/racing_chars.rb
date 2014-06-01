class Drive
  def initialize(course, prev_location=nil)
    @course = course
    @prev_location = prev_location
  end

  def checkpoint
    @course.index('C')
  end

  def gate
    @course.index('_')
  end

  def path
    checkpoint.nil? ? gate : checkpoint
  end

  def move
    if (@prev_location.nil? || path == @prev_location)
      '|'
    elsif (path < @prev_location)
      '/'
    else
      "\\"
    end
  end

  def new_course
    new_course = String.new(@course)
    new_course[path] = move
    new_course
  end
end

class RacingChars
  def initialize(string_inputs = ARGV[0])
    prev_location = nil
    IO.foreach(string_inputs) do |line|
      drive = Drive.new(line, prev_location)
      puts drive.new_course
      prev_location = drive.path
    end
  end
end

#RacingChars.new