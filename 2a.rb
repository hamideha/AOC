start = Time.now

possible_ids = 0
file = File.open("2_input.txt", "r")

RED_LIMIT = 12
GREEN_LIMIT = 13
BLUE_LIMIT = 14

file.each_line do |line|
  possible = true
  game_id = line.scan(/\d+/).first.to_i
  game = line.split(':')[1].split(';').each(&:strip!)
  cubes = game.map! { |round| round.split(',').each(&:strip!) }.flatten

  cubes.each do |cube|
    pair = cube.split(' ')
    number, color = pair[0].to_i, pair[1]

    case color
    when "red"
      if number > RED_LIMIT
        possible = false
        break
      end
    when "blue"
      if number > BLUE_LIMIT
        possible = false
        break
      end
    when "green"
      if number > GREEN_LIMIT
        possible = false
        break
      end
    end
  end

  possible_ids += game_id if possible
end

finish = Time.now
puts possible_ids
puts "Time elapsed #{(finish - start)*1000} milliseconds"
