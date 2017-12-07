INPUT = 347_991

N = [0, -1].freeze
S = [0,  1].freeze
W = [-1, 0].freeze
E = [1,  0].freeze
TURN_LEFT = { N => W, E => N, S => E, W => S }.freeze

def spiral(width, height)
  return false if width < 1 || height < 1

  x = width  / 2
  y = height / 2 # start near the center
  dx, dy = S # initial direction

  matrix = Array.new(height) { Array.new(width) }
  count = 0

  loop do
    count += 1
    matrix[y][x] = count # visit
    # try to turn right
    new_dx, new_dy = TURN_LEFT[[dx, dy]]
    new_x = x + new_dx
    new_y = y + new_dy
    if (new_x >= 0 && new_x < width) && (new_y >= 0 && new_y < height) &&
       matrix[new_y][new_x].nil?
      x = new_x
      y = new_y
      dx = new_dx
      dy = new_dy
    else
      x += dx
      y += dy
      return matrix unless (x >= 0 && x < width) && (y >= 0 && y < height)
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

  turn_left = { N => W, E => N, S => E, W => S }

  # start near the center
  x = (width  / 2)
  y = (height / 2)
  dx, dy = E # initial direction

  matrix = Array.new(height) { Array.new(width, 0) }

  loop.with_index do |_, index|
    val = matrix[y - 1][x - 1].to_i + matrix[y - 1][x].to_i +
          matrix[y - 1][x + 1].to_i + matrix[y][x - 1].to_i +
          matrix[y + 1][x + 1].to_i + matrix[y][x + 1].to_i +
          matrix[y + 1][x - 1].to_i + matrix[y + 1][x].to_i +
          matrix[y][x].to_i

    return val if val > INPUT

    matrix[y][x] = index.zero? ? 1 : val

    # try to turn left
    new_dx, new_dy = turn_left[[dx, dy]]
    new_x = x + new_dx
    new_y = y + new_dy
    if (new_x >= 0 && new_x < width) && (new_y >= 0 && new_y < height) &&
       matrix[new_y][new_x].zero?
      x = new_x
      y = new_y
      dx = new_dx
      dy = new_dy
    else
      x += dx
      y += dy
      return matrix unless (x >= 0 && x < width) && (y >= 0 && y < height)
    end
  end
end

answer2 = cumulative_spiral(11, 11)

puts "Part Two puzzle answer is #{answer2}" # 349975
