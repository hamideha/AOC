calibration_sum = 0
file = File.open("1_input.txt", "r")

file.each_line do |line|
  matches = line.scan(/\d/)
  calibration_sum += (matches.first + matches.last).to_i
end

puts calibration_sum
