start = Time.now

sum_of_cubes = 0
file = File.open("2_input.txt", "r")

file.each_line do |line|
  game = line.split(':')[1].split(';').each(&:strip!)
  cubes = game.map! { |round| round.split(',').each(&:strip!) }.flatten
  r_max, g_max, b_max = 0, 0, 0

  cubes.each do |cube|
    pair = cube.split(' ')
    number, color = pair[0].to_i, pair[1]

    case color
    when "red"
      if number > r_max
        r_max = number
      end
    when "blue"
      if number > g_max
        g_max = number
      end
    when "green"
      if number > b_max
        b_max = number
      end
    end
  end

  sum_of_cubes += r_max * g_max * b_max
end

finish = Time.now
puts sum_of_cubes
puts "Time elapsed #{(finish - start)*1000} milliseconds"
