INPUT = 347991

N, S, W, E = [0, -1], [0, 1], [-1, 0], [1, 0] # directions
TURN_LEFT  = {N => W, E => N, S => E, W => S}

def spiral(width, height)
  return false if width < 1 || height < 1

  x, y = width / 2, height / 2 # start near the center
  dx, dy = S # initial direction
  
  matrix = Array.new(height){ Array.new(width) }
  count = 0

  loop do
    count += 1
    matrix[y][x] = count # visit
    # try to turn right
    new_dx, new_dy = TURN_LEFT[[dx, dy]]
    new_x, new_y = x + new_dx, y + new_dy
    if (0 <= new_x && new_x < width) && (0 <= new_y && new_y < height) && matrix[new_y][new_x].nil?
      x, y = new_x, new_y
      dx, dy = new_dx, new_dy
    else
      x, y = x + dx, y + dy
      return matrix unless (0 <= x && x < width) && (0 <= y && y < height)
    end
  end
end

def find_coordinates(value, matrix)
  matrix.each_with_index do |line, index|
    return [index, line.index(value)] if line.index(value)
  end
  nil
end

def find_distance(coord_start, coord_finish)
  dx = (coord_finish[0] - coord_start[0]).abs
  dy = (coord_finish[1] - coord_start[1]).abs
  dx + dy
end

dimension = Math.sqrt(INPUT).ceil + 1
matrix = spiral(dimension, dimension)

coord_start  = find_coordinates(INPUT, matrix)
coord_finish = find_coordinates(1, matrix)

distance = find_distance(coord_start, coord_finish)

puts "Part One puzzle answer is #{distance}" # 480

def cumulative_spiral(width, height)
  return false if width < 1 || height < 1

  turn_left  = {N => W, E => N, S => E, W => S}

  x, y = (width / 2), (height / 2) # start near the center
  dx, dy = E # initial direction
  
  matrix = Array.new(height){ Array.new(width, 0) }
  first = true

  loop do
    val = matrix[y - 1][x - 1].to_i + matrix[y - 1][x].to_i + matrix[y - 1][x + 1].to_i + 
          matrix[y    ][x - 1].to_i + matrix[y    ][x].to_i + matrix[y    ][x + 1].to_i +
          matrix[y + 1][x - 1].to_i + 
          matrix[y + 1][x].to_i + 
          matrix[y + 1][x + 1].to_i

    return val if val > INPUT
    
    if first
      matrix[y][x] = 1
      first = false
    else
      matrix[y][x] = val # visit
    end

    # try to turn left
    new_dx, new_dy = turn_left[[dx, dy]]
    new_x, new_y = x + new_dx, y + new_dy
    if (0 <= new_x && new_x < width) && (0 <= new_y && new_y < height) && matrix[new_y][new_x].zero?
      x, y = new_x, new_y
      dx, dy = new_dx, new_dy
    else
      x, y = x + dx, y + dy
      return matrix unless (0 <= x && x < width) && (0 <= y && y < height)
    end
  end
end

answer2 = cumulative_spiral(11, 11)

puts "Part Two puzzle answer is #{answer2}" # 349975