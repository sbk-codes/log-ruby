class LogAnalyser
  def initialize
    @data = Hash.new { |hash, label| hash[label] = [] }
  end

  # Processing the log lines to extract and store the data
  def process(input)
    input.each do |element|
      values = element.split(' ')
      values.each do |unformatted_element|
        label, value = unformatted_element.split('=')
        @data[label] << value.to_i
      end
    end
  end

  # Calculating and displaying the aggregated data for each label
  def output
    @data.each do |label, value|
      collector = Analyser.new(value)
      puts "#{label} #{collector}"
    end
  end
end


# Analyser which calculates the maximum, minimum and average values
class Analyser
  def initialize(values)
    @values = values
  end

  def minimum
    @values.min
  end

  def maximum
    @values.max
  end

  def average
    @values.sum.to_f / @values.size
  end

  def to_s
    "min=#{minimum} max=#{maximum} avg=#{average.round}"
  end
end

# calculate_aggregations Function
def calculate_aggregations(log_lines)
  analyser = LogAnalyser.new
  analyser.process(log_lines)
  analyser.output
end

# Example call with sample log lines, update your log lines here
log_lines = ["system=10 user=60 idle=30", "system=50 user=30 idle=20", "system=30 user=0 idle=70"]

# Call the function to perform aggregations and print results
calculate_aggregations(log_lines)
