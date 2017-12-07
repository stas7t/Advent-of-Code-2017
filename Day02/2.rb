checksum1 = 0
checksum2 = 0

def row_result(arr)
  arr.sort! { |x, y| y <=> x }.each_with_index do |value1, index|
    sub_arr = arr[index + 1, arr.length - index]
    sub_arr.each do |value2|
      return value1 / value2 if (value1 % value2).zero?
    end
  end
end

File.readlines('input.txt').each do |line|
  arr = line.split(' ').map(&:to_i)
  checksum1 += arr.max - arr.min
  checksum2 += row_result(arr)
end

puts "Part One puzzle answer is #{checksum1}" # 53460
puts "Part Two puzzle answer is #{checksum2}" # 282
