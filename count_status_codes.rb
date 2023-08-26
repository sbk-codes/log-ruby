require 'time'

class LogAnalyser
  attr_reader :timestamp, :status_code

  def initialize(line)
    values = line.split(' ')
    @timestamp = Time.parse("#{values[0]} #{values[1]}")
    @status_code = values[2].split('=')[1].to_i
  end
end

# Analyser to count status codes for each minute
class Analyser
  def initialize
    @counts = {}
  end

  # Process log entries to count status codes for each minute
  def process(log_entries)
    log_entries.each do |entry|
      minute = entry.timestamp.strftime('%Y-%m-%d %H:%M')
      @counts[minute] ||= Hash.new(0)
      @counts[minute][entry.status_code] += 1
    end
  end

  # Displaying the status code for each minute
  def execute
    @counts.each do |minute, status_counts|
      status = status_counts.map { |code, count| "#{code}=#{count}" }.join(' ')
      puts "#{minute} - #{status}"
    end
  end
end

# count_status_codes Function
def count_status_codes(log_lines)
  log_entries = log_lines.map { |line| LogAnalyser.new(line) }
  counter = Analyser.new
  counter.process(log_entries)
  counter.execute
end

# Example call with sample log lines, update your log lines here
log_lines = [
              "2016-05-01 12:20:20 code=200", "2016-05-01 12:20:30 code=404", 
              "2016-05-01 12:20:40 code=200", "2016-05-01 12:21:10 code=200", 
              "2016-05-01 12:21:11 code=500", "2016-05-01 12:21:15 code=200", 
              "2016-05-01 12:22:05 code=200", "2016-05-01 12:22:07 code=200",
              "2016-05-01 12:22:40 code=400", "2016-05-01 12:22:44 code=200"
            ]

# Call the function to count status codes and print results
count_status_codes(log_lines)
