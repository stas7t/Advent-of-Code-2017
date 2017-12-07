input = [14, 0, 15, 12, 11, 11, 3, 5, 1, 6, 8, 4, 9, 1, 8, 4]

states = []
states << input.join('')

def answer(arr, states)
  answer = 0

  while states.uniq.length == states.length
    value = arr.max
    blocks = value / (arr.length - 1)
    blocks = 1 if blocks < 1

    redistribute(value, blocks, arr)

    answer += 1
    states << arr.join('')
  end

  answer
end

def redistribute(value, blocks, arr)
  current_index = arr.index(value)
  arr[current_index] = value % blocks

  while value >= blocks
    value -= blocks
    current_index += 1
    current_index = 0 if current_index >= arr.length
    arr[current_index] += blocks
  end
end

answer1 = answer(input, states)
answer2 = states.length - 1 - states.index(states.last)

puts "Part One puzzle answer is #{answer1}" # 11137
puts "Part Two puzzle answer is #{answer2}" #  1037
