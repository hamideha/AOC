calibration_sum = 0
numbers_map = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}.freeze
numbers_regex = numbers_map.keys.join('|')

file = File.open("1_input.txt", "r")

file.each_line do |line|
  matches = line.scan(/(?=(#{numbers_regex}|\d))/)
  matches = matches.flatten.map { |match| numbers_map[match] || match }
  calibration_sum += (matches.first + matches.last).to_i
end

puts calibration_sum
