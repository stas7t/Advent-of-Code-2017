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

    arr[i] += 1 if variant == 1 || (variant == 2 && offset < 3)
    arr[i] -= 1 if variant == 2 && offset >= 3

    i += offset
    steps += 1
    break steps if arr[i].nil?
  end
end

puts "Part One puzzle answer is #{answer(input_array, 1)}" # 373160
puts "Part Two puzzle answer is #{answer(input_array, 2)}" # 26395586
