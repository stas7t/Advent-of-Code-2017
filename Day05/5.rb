input_array = []

File.readlines('input.txt').each do |line|
  input_array.push(line.to_i)
end

def answer(array, variant)
  arr = array.clone
  i = 0
  steps = 0

  loop do
    offset = arr[i]

    case variant
    when 1 then arr[i] += 1
    when 2 then offset >= 3 ? arr[i] -= 1 : arr[i] += 1
    end

    i += offset
    steps += 1
    break if arr[i].nil?
  end
  steps
end

puts "Part One puzzle answer is #{answer(input_array, 1)}" # 373160
puts "Part Two puzzle answer is #{answer(input_array, 2)}" # 26395586
